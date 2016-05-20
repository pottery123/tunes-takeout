class RemoveNameFrom < ActiveRecord::Migration
  def change

    remove_column :users, :name, :string, null: true

    add_column :users, :email, :string, null: true
  end
end
