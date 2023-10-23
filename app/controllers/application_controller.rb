class ApplicationController < ActionController::Base
  before_action :basic_authorication, if: -> {Rails.env.production?}
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    case resource
    when User
      boards_path
    when Admin
      admin_users_path
    end
  end

  def after_sign_out_path_for(resource)
    boards_path
  end
  private

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
    end

    def basic_authorication
      authenticate_or_request_with_http_basic do |username, password|
        username == Rails.application.credentials.dig(:basic, :user) && password == Rails.application.credentials.dig(:basic, :password)
      end
    end
end