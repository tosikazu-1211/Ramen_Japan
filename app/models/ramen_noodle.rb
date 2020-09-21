class RamenNoodle < ApplicationRecord

	belongs_to :user
	attachment :image
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :title, :address, :name, :price, :body, presence: true

end