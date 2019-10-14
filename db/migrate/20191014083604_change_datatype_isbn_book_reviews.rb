class ChangeDatatypeIsbnBookReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :book_reviews, :isbn, :string
  end
end