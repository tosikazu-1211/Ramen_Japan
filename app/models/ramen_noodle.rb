class RamenNoodle < ApplicationRecord

	belongs_to :user
	attachment :image

	validates :title, :address, :name, :price, :body, presence: true

end
