class CreateTrainingMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :training_menus do |t|
      t.string :training_manu, nuul: false
      t.timestamps
    end
  end
end
