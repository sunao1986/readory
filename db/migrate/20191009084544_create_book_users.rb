class CreateBookUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :book_users do |t|
      t.integer :book_id
      t.integer :user_id
      t.timestamps
    end
  end
end
