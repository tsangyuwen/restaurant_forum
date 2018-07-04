class ChangeTypeToUser < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :name, :string, :unique => true
  end
end
