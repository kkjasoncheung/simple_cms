class AccessController < ApplicationController
  layout "admin"

  # before action is something done before an action is performed
  # passing in the :except => parameter means do not execute this before_action in the 
  # login, attempt_login, and logout actions 
  # :confirm_logged_in is a private method written in the controller that will be called
  # want to protect EVERY controller from being accessed before someone logs in
  
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
  	# display text & links

  end

  def login
  	# login form

  end

  def attempt_login
  	 if params[:username].present? && params[:password].present?
      # .first turns array to single object
      found_user = AdminUser.where(:username=>params[:username]).first
      if found_user
        
        # use the .authenticate method to validate if the password provided is a match.

        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
    # Mark user as logged in (add 'handstamp')
    # each time a request happens, the session data (user_id and username) is sent to the browser
      # session[:user_id] acts as the 'handstamp' to see if they are logged in.
      session[:user_id] = authorized_user.id
      # setting session[:username] so you don't have to keep going back to the database for the username
      session[:username] = authorized_user.username
    # notify that the user has been logged in via flash hash
      flash[:notice]="You have been logged in."
      redirect_to(:action=>"index")
    else
      flash[:notice]="Invalid username/password combination"
      redirect_to(:action=>'login')
    end
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil

    flash[:notice]="You have been successfully logged out."
    redirect_to(:action=>'login')
  end

  

end
