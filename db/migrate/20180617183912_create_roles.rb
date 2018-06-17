class CreateRoles < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :role, :integer, default: 0, null: false
    change_column :users, :name, :string, null: false
    change_column :users, :email, :string, null: false
    change_column :users, :password_digest, :string, null: false
  end

  def self.down
    remove_column :users, :role
    change_column :users, :name, :string, null: true
    change_column :users, :email, :string, null: true
    change_column :users, :password_digest, :string, null: true
  end
end
