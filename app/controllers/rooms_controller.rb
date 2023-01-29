class RoomsController < ApplicationController
	skip_before_action :verify_authenticity_token

	before_action :room, only: [:show, :update, :destroy, :set_data, :edit_title, :get_data]

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
		room.update_columns(data: params[:parts])
		render json: room
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
