class ApplicationController < ActionController::Base
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
end
