class CreateRelaionships < ActiveRecord::Migration[5.2]
  def change
    create_table :relaionships do |t|
      t.integer :followed_id, null: false
      t.integer :follwer_id, null: false
      t.timestamps
    end
  end
end
