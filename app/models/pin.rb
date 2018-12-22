class Pin < ApplicationRecord
	validates :description, presence:true
	belongs_to :user
	mount_uploader :photo, PhotoUploader
end
