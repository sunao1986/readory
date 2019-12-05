class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # CSRF対策(クロスサイトリクエストフォージェリ) applicaiton.html.erb.rbにコレがある→　<%= csrf_meta_tags %>
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 未ログイン時はログインページに遷移
  def after_sign_in_path_for(resource)
    '/book_reviews'
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image_url, :introduction, :shelfa, :shelfb, :shelfc, :shelfd])
  end

end
