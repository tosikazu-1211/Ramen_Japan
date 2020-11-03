class RamenNoodle < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  belongs_to :user
  attachment :image
  has_many :ramen_noodle_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :title, :address, :name, :price, :body, :image, presence: true
  validates :price, numericality: true
end
