class StaticsController < ApplicationController

	def index 
		render json: { text: '777' }
	end

end
