class RemoveNameFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string, null: true
  end
end
