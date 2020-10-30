class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ramen_noodles
  has_many :ramen_noodle_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, :gender, :age, presence: true
  validates :age, numericality: true
end
