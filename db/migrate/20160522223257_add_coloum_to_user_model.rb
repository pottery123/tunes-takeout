class AddColoumToUserModel < ActiveRecord::Migration
  def change
    add_column :users, :spotify_profile, :string
  end
end
