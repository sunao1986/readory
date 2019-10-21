class AddLikesToBookReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :book_reviews, :likes_count, :integer
  end
end
