class AddShelvesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shelfa, :string
    add_column :users, :shelfb, :string
    add_column :users, :shelfc, :string
    add_column :users, :shelfd, :string
  end
end
