class ApplicationController < ActionController::Base
  protect_from_forgery
 
  private
 
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url 
    end
  end
  
  def logged_in?
    !!current_user
  end

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
  
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

end
