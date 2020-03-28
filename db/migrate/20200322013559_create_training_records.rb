class CreateTrainingRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :training_records do |t|
      t.integer :user_id
      t.integer :training_menu_id
      t.float :weight
      t.string :rep
      t.timestamps
    end
  end
end
