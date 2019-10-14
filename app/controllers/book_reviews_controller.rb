class BookReviewsController < ApplicationController

  def index
    #ユーザー登録後のトップページになるようにroot指定
    # @book_review = BookReview.new
    @book_reviews = BookReview.includes(:user).order("created_at DESC")
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

  def show
    #まだいるかわからない（保留）
  end

  def search
    # @book_review = BookReview.new
    #検索ボタンを/book_reviews/search/パス指定にして、押したらaction作動。
    RakutenWebService.configure do |c|
      c.application_id = '1006308901675971343'
      c.affiliate_id = '195eb844.7af45415.195eb845.fd63d685'
    end

    # 今のところ使ってない 10/14
    if params[:image_url].present?
      @image = params[:image_url]
      # binding.pry
    end

    if params[:title]
       # binding.pry
      @books = RakutenWebService::Books::Book.search(title: params[:title])
    end

    if params[:author]
       # binding.pry
      @books = RakutenWebService::Books::Book.search(author: params[:author])
       # @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

  private
   # form_tagで打ち込むときはrequire(:book_review)を外す。
  def book_review_params
    params.permit(:review_title, :review, :rate, :book_title, :author, :image_url, :detail, :isbn, :item_url)
  end

end
