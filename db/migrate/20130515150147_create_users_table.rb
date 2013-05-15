class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |column|
      column.string :name
      column.string :email
      column.string :encrypted_password
    end
  end
end
