class AddMoreFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :phone, :integer
    add_column :users, :gender, :string
    add_column :users, :userimage, :string
  end
end
