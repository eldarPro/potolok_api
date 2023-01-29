class Room < ApplicationRecord
	belongs_to :project
	validates :title, presence: true, length: { minimum: 2 , maximum: 250 }
end
