class UsersController < ApplicationController
  # before_action :set_review, only: [:show]

  def show
    # binding.pry
    # linktoにuseridのparamsを持たせて分岐
    # @user = User.find(params[:id])
    if current_user.id.to_i == params[:id]
    # rateごとに吸い出して違う変数に保管（5種類）
      @user = User.find(params[:id])
      @book_review = BookReview.find(params[:id])
      @book_reviews = BookReview.where(user_id: params[:id])
      @reviews_one = BookReview.where(user_id: current_user.id, rate: 1).order("created_at DESC")
      @reviews_two = BookReview.where(user_id: current_user.id, rate: 2).order("created_at DESC")
      @reviews_three = BookReview.where(user_id: current_user.id, rate: 3).order("created_at DESC")
      @reviews_four = BookReview.where(user_id: current_user.id, rate: 4).order("created_at DESC")
      @reviews_five = BookReview.where(user_id: current_user.id, rate: nil).order("created_at DESC")

    else
      @user = User.find(params[:id])
      @book_review = BookReview.find(params[:id])
      @book_reviews = BookReview.where(user_id: params[:id])
      @reviews_one = BookReview.where(user_id: params[:id], rate: 1).order("created_at DESC")
      @reviews_two = BookReview.where(user_id: params[:id], rate: 2).order("created_at DESC")
      @reviews_three = BookReview.where(user_id: params[:id], rate: 3).order("created_at DESC")
      @reviews_four = BookReview.where(user_id: params[:id], rate: 4).order("created_at DESC")
      @reviews_five = BookReview.where(user_id: params[:id], rate: nil).order("created_at DESC")
      # binding.pry
    end

  end

  def search
    # ユーザー検索用。show_viewの/users/search/パスで発動
    if params[:name]
      # binding.pry
      @users = User.where('name LIKE(?) AND id !=?',"%#{params[:name]}%", current_user.id)
    end

    if params[:introduction]
      # binding.pry
      @users = User.where('introduction LIKE(?) AND id !=?',"%#{params[:introduction]}%", current_user.id)
    end
  end

  def set_review
    @book_review = BookReview.find(params[:book_review_id])
  end

end
