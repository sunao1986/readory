class BookReviewsController < ApplicationController
  # before_action :set_review, only: [:index, :show]

  def index
    # 最近の投稿一覧
    @book_reviews = BookReview.includes(:user).order("created_at DESC")
    @user_reviews = BookReview.where(user_id: current_user.id)
    # 最近読んだ本
    user_new_reviews = BookReview.where(user_id: current_user.id).order("created_at DESC")
    @user_new_review = user_new_reviews.first
    # よく読まれる本のランキング用
    book_count = BookReview.group(:book_title, :author,:image_url,:item_url).order('count_all DESC').count
    @ranking_book = Hash[book_count].keys 
    @ranking_book_num = Hash[book_count].values
    @shelf_add_name = Shelf.find_by(user_id: current_user.id)
  end

  def new
    # まだ使ってない 10/14
    # @book_review = BookReview.new
  end

  def create
    # binding.pry
    @book_review = BookReview.create(
      review_title: book_review_params[:review_title], 
      review: book_review_params[:review], 
      rate: book_review_params[:rate],
      book_title: book_review_params[:book_title],
      author: book_review_params[:author],
      image_url: book_review_params[:image_url], 
      detail: book_review_params[:detail], 
      isbn: book_review_params[:isbn], 
      item_url: book_review_params[:item_url],     
      user_id: current_user.id
      )
    if @book_review.save
      redirect_to action: :index
    else
      # @book_review = BookReview.new indexに戻るときはつけてあげる。もしくはキャンセルしたparamsが残っていたら
      render :search
    end
  end

  def update
    # binding.pry
    review = BookReview.find(params[:id])
    if review.user_id == current_user.id
       review.update(book_review_params_update)
       redirect_to action: :index
      #update(カラム名: 更新する情報)は引数の指定の仕方が決まっている。このコードは(tweet_paramsメソッド)なのでtext,imageが更新される
    end
  end

  def show
    @book = BookReview.find(params[:id])
  end

  def search
    # @book_review = BookReview.new
    #検索ボタンを/book_reviews/search/パス指定にして、押したらaction作動。
    RakutenWebService.configure do |c|
      c.application_id = '1006308901675971343'
      c.affiliate_id = '195eb844.7af45415.195eb845.fd63d685'
    end
    # ユーザー情報用
    @user_reviews = BookReview.where(user_id: current_user.id)
    # ランキング用
    book_count = BookReview.group(:book_title, :author,:image_url).order('count_all DESC').count
    @ranking_book = Hash[book_count].keys 
    @ranking_book_num = Hash[book_count].values
    # selectの本棚用
     # 該当ユーザーがすでに持ってる本棚名を取得
    shelf_name_arry_two = User.where(id: current_user.id).pluck(:shelfa, :shelfb, :shelfc, :shelfd)
     # 配列が重複するので一度外す
    shelf_name_arry = shelf_name_arry_two.flatten
     # 本棚を増やした場合はそのnameを配列で取得
    shelf_add_name = Shelf.where(user_id: current_user.id).pluck(:name)
    shelf_add_arry = shelf_add_name .flatten
     # eachとindexでidとnameを付けたハッシュにする
    @shelf_add = [{id: 5, name: "#{shelf_add_arry[0]}"}]
     # 本棚を追加した時とそうでない時を分岐して変数に入れる
     # idとnameを付けたハッシュにする。# すでに持ってる本棚名ハッシュと結合する。
    if shelf_add_name.present?
      @shelf_name = [{id: 1, name: "#{shelf_name_arry[0]}"},{id: 2, name: "#{shelf_name_arry[1]}"},{id: 3, name: "#{shelf_name_arry[2]}"},{id: 4, name: "#{shelf_name_arry[3]}"}, {id: 5, name: "#{shelf_add_name[0]}"}]
    else
      @shelf_name = [{id: 1, name: "#{shelf_name_arry[0]}"},{id: 2, name: "#{shelf_name_arry[1]}"},{id: 3, name: "#{shelf_name_arry[2]}"},{id: 4, name: "#{shelf_name_arry[3]}"}]
    end

    if params[:title].present?
       # binding.pry
      @books = RakutenWebService::Books::Book.search(title: params[:title])

    end

    if params[:author].present?
       # binding.pry
      @books = RakutenWebService::Books::Book.search(author: params[:author])
       # @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

  def destroy
    @book_review = BookReview.find(params[:id])
    @book_review.destroy
    redirect_to action: :index
  end

  private
   # form_tagで打ち込むときはrequire(:book_review)を外す。
  def book_review_params
    params.require(:book_review).permit(:review_title, :review, :rate, :book_title, :author, :image_url, :detail, :isbn, :item_url)
  end

  def book_review_params_update
    params.permit(:review_title, :review, :rate, :book_title, :author, :image_url, :detail, :isbn, :item_url)
  end

  def set_review
    @book_review = BookReview.find(params[:id])
  end

end
