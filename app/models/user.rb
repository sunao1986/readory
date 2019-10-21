class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :reviews
  # has_many :book_users
  # has_many :books, through: :book_users  
  has_many :book_reviews, dependent: :destroy
  has_many :likes, dependent: :destroy

  mount_uploader :image_url, ImageUploader
end
