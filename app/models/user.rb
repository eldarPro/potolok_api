class User < ApplicationRecord

	has_many :projects, dependent: :destroy

	validates :lastname, presence: true, length: { minimum: 2 , maximum: 50 }
	validates :name, presence: true, length: { minimum: 2 , maximum: 50 }
	validates :patronymic, presence: true, length: { minimum: 2 , maximum: 50 }
	validates :company, presence: true, length: { minimum: 2 , maximum: 250 }
	
end
