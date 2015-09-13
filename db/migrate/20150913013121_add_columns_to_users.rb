class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :display_name, :string
    add_column :users, :access_token, :string
    add_column :users, :uuid, :string
    add_column :users, :roles, :string, array: true, default: ['user'], null: false
    add_index  :users, :roles, using: 'gin'
  end
end
