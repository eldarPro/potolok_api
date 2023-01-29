class ContoursController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index 
		contours = Contour.order('id DESC')
		render json: contours
	end

	def show
		contour = Contour.find(params[:id])
		render json: contour
	end

	def create
		contour = Contour.new(contour_params.merge({user_id:1}))
		
		#Contour.update_all(default: false) if contour.default

	  if contour.save
	    render json: contour, status: :created
	  else
	    render json: contour.errors, status: :unprocessable_entity
	  end
	end

	def update
	  contour = Contour.find(params[:id])

	  Contour.update_all(default: false) if !contour.default && contour_params[:default]

	  if contour.update(contour_params)
	    render json: contour
	  else
	    render json: contour.errors, status: :unprocessable_entity
	  end
	end

	def destroy
		contour = Contour.find(params[:id])
	  contour.destroy
	  render json: { success: true }
	end

	private

	def contour_params
	  params.require(:contour).permit(:title, :price, :price_install, :price_corner, :default)
	end

end
