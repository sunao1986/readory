class AddTagToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :isbn, :string
    add_column :books, :url, :string
  end
end
