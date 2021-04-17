class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resource)
      user_path(resource)
   end
   def autheniticate_user
     if @current_user==nil
        flash[:notice]="ログインが必要です"
        redirect_to("/users/sign_in")
     end
   end


  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

end


