class Room < ApplicationRecord

	DETAIL_TYPES = [
		CONTOUR = 'contour'
	]

	CONTOUR_MARKS = ['A','B','C','D','E','F','G','H','I','J','K','L','M',
									 'N','O','P','Q','R','S','T','U','V','W','X','Y','Z']

	belongs_to :project
	validates :title, presence: true, length: { minimum: 2 , maximum: 250 }
	validates :linear_mtrs, numericality: { greater_than_or_equal_to: 0 }
	validates :square_mtrs, numericality: { greater_than_or_equal_to: 0 }

end
