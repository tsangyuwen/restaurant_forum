class ChangeRoldeToRole < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :rolde, :rold
  end
end
