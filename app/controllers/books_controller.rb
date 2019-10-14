class BooksController < ApplicationController

  def index
    #ユーザー登録後のトップページになるようにroot指定
  end

  def new
    # binding.pry
    # @books = []
    # @title = params[:title]
    # if @title.present?
      # @books = RakutenWebService::Books::Book.search({
        # title: @title,
        # booksGenreId: '001004',
        # hits: 20,
      # })

      # results.each do |result|
        # book = Book.new(read(result))
        # @books << book
      # end
    # end
  end

  def create
  end

  def show
    #まだいるかわからない（保留）
  end

  def search
    #検索ボタンを/books/search/パス指定にして、押したらaction作動。
    RakutenWebService.configure do |c|
      c.application_id = '1006308901675971343'
    end
    # @title = params[:title]
    if params[:title]
      # binding.pry
      @books = RakutenWebService::Books::Book.search(title: params[:title])
    # if params[:keyword]
      # binding.prys
    #  @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    # @books = RakutenWebService::Books::Total.search(title: params[:title])
      # binding.pry
    end
  end

  private

  def read(result)
    title = result['title']
    url = result['itemUrl']
    isbn = result['isbn']
    image_url = result['mediumImageUrl'].gsub('?_ex=120x120', '')

    {
      title: title,
      url: url,
      isbn: isbn,
      image_url: image_url,
    }

  end
end
