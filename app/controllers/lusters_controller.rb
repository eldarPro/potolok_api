class LustersController < ApplicationController
	skip_before_action :verify_authenticity_token

	before_action :luster, only: [:show, :update, :destroy]

	def index 
		lusters = Luster.order('id DESC')
		render json: lusters
	end

	def show
		render json: luster
	end

	def create
		luster = Luster.new(luster_params.merge({user_id:1}))
		
	  if luster.save
	    render json: luster, status: :created
	  else
	    render json: luster.errors, status: :unprocessable_entity
	  end
	end

	def update
	  if luster.update(luster_params)
	    render json: luster
	  else
	    render json: luster.errors, status: :unprocessable_entity
	  end
	end

	def destroy
	  luster.destroy
	  render json: { success: true }
	end

	private

	def luster
		Luster.find(params[:id])
	end

	def luster_params
	  params.require(:luster).permit(:title, :price, :price_install, :color)
	end

end
