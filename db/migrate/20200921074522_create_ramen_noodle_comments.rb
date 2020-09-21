class CreateRamenNoodleComments < ActiveRecord::Migration[5.2]
  def change
    create_table :ramen_noodle_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :ramen_noodle_id

      t.timestamps
    end
  end
end
