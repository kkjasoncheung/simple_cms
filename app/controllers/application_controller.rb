class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end


# all controllers inherit from this application_controller 


private 

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return false # halts the before_action chain. Do not let the action proceed.
    else
      return true
    end
  end