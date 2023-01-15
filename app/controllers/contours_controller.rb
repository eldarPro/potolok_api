class ContoursController < ApplicationController

	def index 
		render json: { id: 1, title: 'super', years: 18 }
	end

end
