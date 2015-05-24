class AddAuthenticationTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authentication_token, :string
    add_index :users, :authentication_token
    add_column :users, :rake, :string
    add_column :users, :db, :migrate
  end
end
