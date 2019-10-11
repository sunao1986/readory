class Ful < ApplicationRecord
  belongs_to :review, counter_cache: :ful_count
  belongs_to :user
end