class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :autorized, :string
    add_column :users, :lastname, :string
    add_column :users, :profile, :string
    add_column :users, :twitter, :string
    add_column :users, :clave, :string
    add_column :users, :name, :string
  end
end
