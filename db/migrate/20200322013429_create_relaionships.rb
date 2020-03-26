class CreateRelaionships < ActiveRecord::Migration[5.2]
  def change
    create_table :relaionships do |t|
      t.integer :followed_id, null: false
      t.integer :follower_id, null: false
      t.timestamps
    end
    add_index :relaionships, :follower_id
    add_index :relaionships, :followed_id
    add_index :relaionships, [:follower_id, :followed_id], unique: true
  end
end
