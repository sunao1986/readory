class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :review 
      t.integer :rate
      t.integer :book_id
      t.integer :user_id
      t.timestamps
    end
  end
end
