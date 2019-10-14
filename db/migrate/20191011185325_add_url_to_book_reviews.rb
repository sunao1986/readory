class AddUrlToBookReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :book_reviews, :item_url, :string
  end
end
