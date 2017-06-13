class Post < ApplicationRecord
	belongs_to :user
	mount_uploader :image, ImageUploader
	has_many :favorites, dependent: :destroy

	def favorited_by? user
		favorites.where(user_id: user.id).exists?
	end
end
