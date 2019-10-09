class Book < ApplicationRecord
  hasmany :reviews
  hasmany :book_users
  has_many :users, through: :book_users
end
