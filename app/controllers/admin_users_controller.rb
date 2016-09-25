class AdminUsersController < ApplicationController
  	
  layout 'admin'

  before_action :confirm_logged_in 

  def index
  	@admin_users = AdminUser.sorted
  end

  def new

  end
  
  def create
  	@admin_user = AdminUser.new(admin_user_params)

  	if @admin_user.save 
  		flash[:notice]="New Admin User has been created."
  		redirect_to(:action=>'index')
  	else 
  		flash[:notice] = "New Admin User was not created."
  		render('new')
  	end

  end
  
  def edit
  	@admin_user = AdminUser.find(params[:id])

  end

  def update
  	@admin_user = AdminUser.find(params[:id])
  	if @admin_user.update_attributes(admin_user_params)
  		flash[:notice]="Admin User updated."
  		redirect_to(:action=>'index')
  	else
  		flash[:notice]="Admin User not updated."
  		render('edit')
  	end
  end

  def delete
  	@admin_user = AdminUser.find(params[:id])
  end

  def destroy
  	admin_user = AdminUser.find(params[:id])
  	if admin_user.destroy
  		flash[:notice]="#{admin_user.name} has been permanently deleted."
  		redirect_to(:action=>'index')
  	else
  		flash[:notice]='There was a problem deleting #{admin_user.name}'
  		render('delete')
  	end

  end


  private 	

  def admin_user_params 
  	params.require(:admin_user).permit(:username, :first_name, :last_name, :email, :password)
  end

end
