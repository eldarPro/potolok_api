class RoomsController < ApplicationController
	skip_before_action :verify_authenticity_token

	before_action :room, only: [:show, :update, :destroy, :set_data, :edit_title, :get_data, :contours, 
															:change_contour, :divide_contour, :change_cloth]

	def index 
		rooms = Room.order('id DESC')
		render json: rooms
	end

	def show
		render json: room
	end

	def get_data
		render json: room.data
	end

	def set_data
		room.update_columns({
			data: params[:parts], 
			square_mtrs: params[:square_mtrs], 
			linear_mtrs: params[:linear_mtrs],
			cloth_id: params[:cloth_id]
		})
		render json: room
	end

	def change_contour
		data = room.data
		res = false
		find_contour = nil
		data.each do |row|
			find_contour = row['num'] == params[:num].to_i
			next unless find_contour.present?
			row['contour_id'] = params[:value].to_i
			break
		end
		res = room.update(data: data) if find_contour.present?		
		render json: { success: res }
	end

	def change_cloth
		room.update_column(:cloth_id, params[:value])
		render json: { success: true }
	end

	def divide_contour
		data = room.data
		res = false
		find_contour = nil
		data.each_with_index do |row, inx|
			find_contour = row['num'] == params[:num].to_i
			next unless find_contour
			new_contour = Marshal.load(Marshal.dump(row))
			new_contour['finish'] = row['finish']
			row['finish']					= false

			row['distance'] 				 = params[:value].to_i
			new_contour['distance'] -= params[:value].to_i
			
			if row['direction'] == 'right'
				row['lineTo']['x'] -= new_contour['distance'] 
				new_contour['moveTo']['x'] = row['lineTo']['x']
			end	
			
			if row['direction'] == 'left'
				row['moveTo']['x'] -= new_contour['distance'] 
				new_contour['lineTo']['x'] = row['moveTo']['x']
			end

			if row['direction'] == 'bottom'
				row['lineTo']['y'] -= new_contour['distance'] 
				new_contour['moveTo']['y'] = row['lineTo']['y']
			end

			if row['direction'] == 'top'
				row['lineTo']['y'] = row['moveTo']['y'] - params[:value].to_i
				new_contour['moveTo']['y'] = row['lineTo']['y']
			end
			
			data.insert(inx+1, new_contour)
			break
		end

		# Если нашелся, то устанавливает заново нумерацию и буквы по новому порядку
		if find_contour.present?	
			last_mark = nil
			maxSize = data.length
			data.each_with_index do |row, inx|
				next if row['type'] != Room::CONTOUR

				if last_mark.present?
					start_mark = Room::CONTOUR_MARKS[inx]
					end_mark   = Room::CONTOUR_MARKS[inx + 1]
				else
					start_mark = Room::CONTOUR_MARKS[0]
					end_mark   = Room::CONTOUR_MARKS[1]
				end

				last_mark = end_mark
				
				row['num'] = inx
				row['mark']['start'] = start_mark
				row['mark']['end']   = end_mark

				if row['finish']
					row['mark']['end'] = Room::CONTOUR_MARKS[0]
					break
				end
			end

			res = room.update(data: data)
		end

		render json: { success: res }
	end

	def edit_title
		room.update_columns(title: params[:title])
		render json: room
	end

	def create
		room = Room.new(room_params)
		
	  if room.save
	    render json: room, status: :created
	  else
	    render json: room.errors, status: :unprocessable_entity
	  end
	end

	def update
	  if room.update(room_params)
	    render json: room
	  else
	    render json: room.errors, status: :unprocessable_entity
	  end
	end

	def destroy
	  room.destroy
	  render json: { success: true }
	end

	private

	def room
		Room.find(params[:id])
	end

	def room_params
	  params.require(:room).permit(:title, :project_id)
	end

end
