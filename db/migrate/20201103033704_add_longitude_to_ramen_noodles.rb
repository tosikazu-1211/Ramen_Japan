class AddLongitudeToRamenNoodles < ActiveRecord::Migration[5.2]
  def change
    add_column :ramen_noodles, :longitude, :float
  end
end
