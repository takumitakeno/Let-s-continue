class AddNameToTrees < ActiveRecord::Migration[5.2]
  def change
  	rename_table :relaionships, :relationships
  end
end
