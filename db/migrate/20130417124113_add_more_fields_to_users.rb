class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :name, :first_name

    add_column :users, :username, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :bool
  end
end
