class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :post, null: false
      t.string :training_image_id
      t.timestamps
    end
  end
end
