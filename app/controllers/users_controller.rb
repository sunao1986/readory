class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def show
    # ユーザー情報用
    @user = User.find(params[:id])
    @user_reviews = BookReview.where(user_id: params[:id]).order("created_at DESC")
    # 最近読んだ本を読んだ他のユーザー一覧で使う
    user_new_reviews = BookReview.where(user_id: current_user.id).order("created_at DESC")
    other_new_reviews = BookReview.where(user_id: @user.id).order("created_at DESC")
    if user_new_reviews.present?
      @user_new_review = user_new_reviews.first
    end
    if other_new_reviews.present?
      @other_new_review = other_new_reviews.first
    end
    if @user_new_review.present?
      @match_reviews = BookReview.where(book_title: @user_new_review.book_title).where.not(user_id: current_user.id).order("created_at DESC").limit(10)
    end
    # ランダム既読本を読んだユーザー一覧
    rand_reviews = BookReview.where(user_id: current_user.id).order("RAND()").limit(10)
    if rand_reviews.present?
      @rand_review = rand_reviews.first
    end
    if @rand_review.present?
      @match_rand = BookReview.where(book_title: @rand_review.book_title).where.not(user_id: current_user.id).order("created_at DESC").limit(10)
    end

    shelf_name_arry_two = User.where(id: current_user.id).pluck(:shelfa, :shelfb, :shelfc, :shelfd)
    shelf_name_arry = shelf_name_arry_two.flatten
    shelf_add_name = Shelf.where(user_id: current_user.id).pluck(:name)
    shelf_add_arry = shelf_add_name .flatten
    @shelf_add = [{id: 5, name: "#{shelf_add_arry[0]}"}]
    if shelf_add_name.present?
     @shelf_name = [{id: 1, name: "#{shelf_name_arry[0]}"},{id: 2, name: "#{shelf_name_arry[1]}"},{id: 3, name: "#{shelf_name_arry[2]}"},{id: 4, name: "#{shelf_name_arry[3]}"}, {id: 5, name: "#{shelf_add_name[0]}"}]
    else
     @shelf_name = [{id: 1, name: "#{shelf_name_arry[0]}"},{id: 2, name: "#{shelf_name_arry[1]}"},{id: 3, name: "#{shelf_name_arry[2]}"},{id: 4, name: "#{shelf_name_arry[3]}"}]
    end
    @shelf_add_name = Shelf.find_by(user_id: @user.id)
    

    # 本棚情報
    @shelves = Shelf.where(user_id: @user.id).order(id: "ASC")

    if current_user.id.to_i == params[:id]
    # rateごとに吸い出して違う変数に保管（5種類）
      @book_review = BookReview.find(params[:id])
      @book_reviews = BookReview.where(user_id: params[:id])
      @reviews_one = BookReview.where(user_id: current_user.id, rate: 1).order("created_at DESC")
      @reviews_two = BookReview.where(user_id: current_user.id, rate: 2).order("created_at DESC")
      @reviews_three = BookReview.where(user_id: current_user.id, rate: 3).order("created_at DESC")
      @reviews_four = BookReview.where(user_id: current_user.id, rate: 4).order("created_at DESC")
      @reviews_five = BookReview.where(user_id: current_user.id, rate: 5).order("created_at DESC")

    else
      @book_review = BookReview.find(params[:id])
      @book_reviews = BookReview.where(user_id: params[:id])
      @reviews_one = BookReview.where(user_id: params[:id], rate: 1).order("created_at DESC")
      @reviews_two = BookReview.where(user_id: params[:id], rate: 2).order("created_at DESC")
      @reviews_three = BookReview.where(user_id: params[:id], rate: 3).order("created_at DESC")
      @reviews_four = BookReview.where(user_id: params[:id], rate: 4).order("created_at DESC")
      @reviews_five = BookReview.where(user_id: params[:id], rate: 5).order("created_at DESC")
    end

  end

  def search
    # ユーザー情報用
    @user_reviews = BookReview.where(user_id: current_user.id)
    # 最近読んだ本を読んだ他のユーザー一覧で使う
    user_new_reviews = BookReview.where(user_id: current_user.id).order("created_at DESC")
    user_new_review = user_new_reviews.first
    @match_reviews = BookReview.where(book_title: user_new_review.book_title).where.not(user_id: current_user.id).order("created_at DESC").limit(10)
    # ランダム既読本を読んだユーザー一覧
    rand_reviews = BookReview.where(user_id: current_user.id).order("RAND()").limit(10)
    @rand_review = rand_reviews.first
    @match_rand = BookReview.where(book_title: @rand_review.book_title).where.not(user_id: current_user.id).order("created_at DESC").limit(10)

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

  def edit
  end

  def update
    if params[:shelfa].present?
      @user.update(shelfa: params[:shelfa])
      return
    end
    if params[:shelfb].present?
      @user.update(shelfb: params[:shelfb])
      return
    end
    if params[:shelfc].present?
      @user.update(shelfc: params[:shelfc])
      return
    end
    if params[:shelfd].present?
      @user.update(shelfd: params[:shelfd])
      return
    end

    if params[:name].present? or params[:image_url].present? or params[:introduction].present?
      @user.update(update_user)
      redirect_to action: :show
    else
      redirect_to action: :show
    end

    # if @user.update(shelfa: params[:shelfa])
    #   redirect_to action: :show
    # else
    #   redirect_to action: :show
    # end
  end

  private
  # form_tagで打ち込むときはrequire(:book_review)を外す。
 def update_user
   params.require(:user).permit(:name, :image_url, :introduction, :shelfa,:shelfb,:shelfc,:shelfd)
 end

 def set_user
   @user = User.find(params[:id])
 end


end
