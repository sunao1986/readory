class BookReview < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  # クリックしようとしているユーザーのidに紐づくlikesテーブルのidを引っ張り出す
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
