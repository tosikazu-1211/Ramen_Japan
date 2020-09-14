class CreateRamenNoodles < ActiveRecord::Migration[5.2]
  def change
    create_table :ramen_noodles do |t|
      t.string :title
      t.string :address
      t.string :image_id
      t.string :name
      t.integer :price
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
