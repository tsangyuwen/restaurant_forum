class ChangeRoldToRole < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :rold, :role
  end
end
