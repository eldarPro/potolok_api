class AdditionalServicesController < ApplicationController
	skip_before_action :verify_authenticity_token

	before_action :service, only: [:show, :update, :destroy]

	def index 
		services = AdditionalService.order('id DESC')
		render json: services
	end

	def show
		render json: service
	end

	def create
		service = AdditionalService.new(service_params.merge({user_id:1}))
		
	  if service.save
	    render json: service, status: :created
	  else
	    render json: service.errors, status: :unprocessable_entity
	  end
	end

	def update
	  if service.update(service_params)
	    render json: service
	  else
	    render json: service.errors, status: :unprocessable_entity
	  end
	end

	def destroy
	  service.destroy
	  render json: { success: true }
	end

	private

	def service
		AdditionalService.find(params[:id])
	end

	def service_params 
	  params.require(:additional_service).permit(:title, :price, :price_install, :description)
	end

end
