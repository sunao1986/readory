class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # CSRF対策(クロスサイトリクエストフォージェリ) applicaiton.html.erb.rbにコレがある→　<%= csrf_meta_tags %>
  # before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # 未ログイン時はログインページに遷移
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image_url, :introduction])
  end

end
