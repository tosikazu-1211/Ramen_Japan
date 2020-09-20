class Favorite < ApplicationRecord

	belongs_to :user
	belongs_to :ramen_noodle

end
