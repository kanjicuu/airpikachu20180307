class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?

  def teacher_check
  	@reser_ = current_user.rooms
  	@check_ = false

  	@reser_.each do |room|
  	  if room.teacher_auth
  	  	@check_ = true
  	  end
  	end

  	return @check_
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :sonoligoid])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :sonoligoid, :description, :award, :belong, :webpage, :twitter, :blog])
  end

end
