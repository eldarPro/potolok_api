class Cloth < ApplicationRecord

	def self.default
		find_by(default: true)
	end

end
