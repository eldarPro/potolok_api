class ClothsController < ApplicationController
	skip_before_action :verify_authenticity_token

	before_action :cloth, only: [:show, :update, :destroy]

	def index 
		contours = Cloth.order('id DESC')
		render json: contours
	end

	def show
		render json: cloth
	end

	def create
		cloth = Cloth.new(cloth_params.merge({user_id:1}))
		
	  if cloth.save
	  	Cloth.update_all(default: false) if cloth.default
	    render json: cloth, status: :created
	  else
	    render json: cloth.errors, status: :unprocessable_entity
	  end
	end

	def update

	  if cloth.update(cloth_params)
	  	Cloth.update_all(default: false) if cloth.default
	    render json: cloth
	  else
	    render json: cloth.errors, status: :unprocessable_entity
	  end
	end

	def destroy
	  cloth.destroy
	  render json: { success: true }
	end

	private

	def cloth
		Cloth.find(params[:id])
	end

	def cloth_params
	  params.require(:cloth).permit(:title, :price, :price_install, :price_corner, 
	  															:price_install_corner, :default, :color)
	end

end
