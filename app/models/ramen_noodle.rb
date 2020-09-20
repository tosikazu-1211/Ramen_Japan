class RamenNoodle < ApplicationRecord

	belongs_to :user
	attachment :image
	hasmany :favorites, dependent: :destroy

	def favoreted_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :title, :address, :name, :price, :body, presence: true

end
