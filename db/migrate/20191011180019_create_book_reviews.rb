class CreateBookReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :book_reviews do |t|
      t.string :review_title, null: false
      t.text :review
      t.integer :rate
      t.string :book_title
      t.string :author
      t.string :image_url
      t.text :detail
      t.integer :isbn
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
