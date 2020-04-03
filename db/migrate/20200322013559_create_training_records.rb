class CreateTrainingRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :training_records do |t|
      t.integer :user_id, null: false
      t.integer :training_menu_id, null: false
      t.float :weight, null: false
      t.string :rep, null: false
      t.timestamps
    end
  end
end
