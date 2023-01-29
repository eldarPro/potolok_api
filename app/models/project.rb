class Project < ApplicationRecord
	
	belongs_to :user
	has_many :rooms, dependent: :destroy                       

	validates :title, presence: true, uniqueness: { scope: :user_id }, length: { minimum: 2 , maximum: 250 }

end
