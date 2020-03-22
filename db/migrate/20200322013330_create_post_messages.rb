class CreatePostMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_messages do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.string :post_message
      t.timestamps
    end
  end
end
