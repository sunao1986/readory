class Like < ApplicationRecord
    belongs_to :book_review, counter_cache: :likes_count
    belongs_to :user
end
