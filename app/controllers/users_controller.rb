class UsersController < ApplicationController
  # before_action :set_review, only: [:show]

  def show
    # ユーザー情報用
    @user_reviews = BookReview.where(user_id: params[:id]).order("created_at DESC")
    # ランキング用
    book_count = BookReview.group(:book_title, :author,:image_url).order('count_all DESC').count
    @ranking_book = Hash[book_count].keys 
    @ranking_book_num = Hash[book_count].values
    # 最近読んだ本を読んだ他のユーザー一覧で使う
    user_new_reviews = BookReview.where(user_id: current_user.id).order("created_at DESC")
    user_new_review = user_new_reviews.first
    @match_reviews = BookReview.where(book_title: user_new_review.book_title).where.not(user_id: current_user.id).order("created_at DESC").limit(10)
    rand_review = BookReview.where(user_id: current_user.id).order("RAND()").limit(1)
    @match_rand = BookReview.where(book_title: rand_review.book_title).where.not(user_id: current_user.id).order("created_at DESC").limit(10)
    binding.pry
    # linktoにuseridのparamsを持たせて分岐
    # @user = User.find(params[:id])
    if current_user.id.to_i == params[:id]
    # rateごとに吸い出して違う変数に保管（5種類）
      @user = User.find(params[:id])
      #このデータ意味ない
      @book_review = BookReview.find(params[:id])
      @book_reviews = BookReview.where(user_id: params[:id])
      @reviews_one = BookReview.where(user_id: current_user.id, rate: 1).order("created_at DESC")
      @reviews_two = BookReview.where(user_id: current_user.id, rate: 2).order("created_at DESC")
      @reviews_three = BookReview.where(user_id: current_user.id, rate: 3).order("created_at DESC")
      @reviews_four = BookReview.where(user_id: current_user.id, rate: null).order("created_at DESC")
      @reviews_five = BookReview.where(user_id: current_user.id, rate: 5).order("created_at DESC")

    else
      @user = User.find(params[:id])
      @book_review = BookReview.find(params[:id])
      @book_reviews = BookReview.where(user_id: params[:id])
      @reviews_one = BookReview.where(user_id: params[:id], rate: 1).order("created_at DESC")
      @reviews_two = BookReview.where(user_id: params[:id], rate: 2).order("created_at DESC")
      @reviews_three = BookReview.where(user_id: params[:id], rate: 3).order("created_at DESC")
      @reviews_four = BookReview.where(user_id: params[:id], rate: nil).order("created_at DESC")
      @reviews_five = BookReview.where(user_id: params[:id], rate: 5).order("created_at DESC")
    end

  end

  def search
    # ランキングからdetailを呼び出す用
    # @book_review = BookReview.find(params[:id])
    # ユーザー情報用
    @user_reviews = BookReview.where(user_id: current_user.id)
    # ランキング用(like_count数が大きい順に10件取得)
    @ranking_reviews = BookReview.order("likes_count DESC").limit(10)
    # ユーザー検索用。show_viewの/users/search/パスで発動
    if params[:name].present?
      # binding.pry
      @users = User.where('name LIKE(?) AND id !=?',"%#{params[:name]}%", current_user.id)
    end

    if params[:introduction].present?
      # binding.pry
      @users = User.where('introduction LIKE(?) AND id !=?',"%#{params[:introduction]}%", current_user.id)
    end
  end

  def set_review
    @book_review = BookReview.find(params[:book_review_id])
  end

end
