class LikesController < ApplicationController
  # binding.pry
  before_action :set_book_review, only: [:create, :destroy]

  def create
    # binding.pry
    @like = Like.create(user_id: current_user.id, book_review_id: params[:book_review_id])
    @likes =Like.where(params[:book_review_id])
    @book_review = BookReview.find(params[:book_review_id])
  end

  def destroy
    # binding.pry
    @like = Like.find_by(user_id: current_user.id, book_review_id: params[:book_review_id])
    @like.destroy
    @likes =Like.where(book_review_id: params[:book_review_id])
    @book_review = BookReview.find(params[:book_review_id])
  end

  private

  def set_book_review
    @book_review = BookReview.find(params[:book_review_id])
    # ダブってるから検証
    @like = Like.find_by(user_id: current_user.id, book_review_id: params[:book_review_id])
  end
end