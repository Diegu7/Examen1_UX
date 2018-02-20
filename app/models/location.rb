class Location < ApplicationRecord
	has_many :recordings, dependent: :destroy
	belongs_to :user
end
