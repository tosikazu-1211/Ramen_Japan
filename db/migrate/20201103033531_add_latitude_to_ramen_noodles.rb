class AddLatitudeToRamenNoodles < ActiveRecord::Migration[5.2]
  def change
    add_column :ramen_noodles, :latitude, :float
  end
end
