class Contour < ApplicationRecord

	belongs_to :user

	validates :title, presence: true, uniqueness: { scope: :user_id }, length: { minimum: 2 , maximum: 250 }
	validates :price, numericality: { greater_than: 0 }
	validates :price_install, numericality: { greater_than: 0 }
	validates :price_corner, numericality: { greater_than: 0 }
	validates :price_install_corner, numericality: { greater_than: 0 }

	def self.default
		find_by(default: true)
	end

end
