class UsersController < ApplicationController

  def show
    @reviews = BookReview.where(user_id: current_user.id).order("created_at DESC")
    # @articles = Article.where(user_id: current_user.id).order("created_at DESC")
    
  end

  def search
    # ユーザー検索用。show_viewの/users/search/パスで発動
    if params[:name]
      # binding.pry
      @users = User.where('name LIKE(?) AND id !=?',"%#{params[:name]}%", current_user.id)
    end

    if params[:intoduction]
      # binding.pry
      @users = User.where('introduction LIKE(?) AND id !=?',"%#{params[:introduction]}%", current_user.id)
    end
  end

end
