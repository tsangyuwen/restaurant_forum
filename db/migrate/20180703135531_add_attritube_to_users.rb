class AddAttritubeToUsers < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :avatar, :string
  end
end
