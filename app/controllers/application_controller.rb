class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # CSRF対策(クロスサイトリクエストフォージェリ) applicaiton.html.erb.rbにコレがある→　<%= csrf_meta_tags %>
  before_action :authenticate_user!
  # 未ログイン時はログインページに遷移
end
