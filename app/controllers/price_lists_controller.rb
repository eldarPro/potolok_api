class PriceListsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def count_elements
		render json: {
			contours: Contour.count,
			cloths: Cloth.count,
			lusters: Luster.count,
			services: AdditionalService.count
		}
	end

	def defaults
		render json: {
			contour: Contour.default,
			cloth: Cloth.default,
			luster: Luster.first
		}
	end

end
