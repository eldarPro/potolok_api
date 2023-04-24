class ContoursController < ApplicationController
	skip_before_action :verify_authenticity_token

	before_action :contour, only: [:show, :update, :destroy]

	def index 
		contours = Contour.order('id DESC')
		render json: contours
	end

	def show
		render json: contour
	end

	def create
		contour = Contour.new(contour_params.merge({user_id:1}))
		
	  if contour.save
	    render json: contour, status: :created
	  else
	    render json: contour.errors, status: :unprocessable_entity
	  end
	end

	def update
	  Contour.update_all(default: false) if !contour.default && contour_params[:default]

	  if contour.update(contour_params)
	    render json: contour
	  else
	    render json: contour.errors, status: :unprocessable_entity
	  end
	end

	def destroy
	  contour.destroy
	  render json: { success: true }
	end

	private

	def contour
		Contour.find(params[:id])
	end

	def contour_params
	  params.require(:contour).permit(:title, :price, :price_install, :price_corner, :default, :color)
	end

end
