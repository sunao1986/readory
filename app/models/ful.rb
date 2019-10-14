class Ful < ApplicationRecord
  belongs_to :book_review, counter_cache: :ful_count
  belongs_to :user
end