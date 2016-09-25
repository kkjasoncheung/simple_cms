class PublicController < ApplicationController
 

  layout 'public'

  before_action :set_up_navigation

  def index
  	# introductory text only
  end

  def show
  	# :permalink via the routes folder sending the permalink
  	@page = Page.where(:permalink => params[:permalink], :visible =>true).first
  	if @page.nil?
  		redirect_to(:action=>"index")
  	else
  		# display the page content using show.html.erb
  	end
  end
  
  private
  
  def set_up_navigation
  	# now you can use the @subject instance variable in templates
  	  @subjects = Subject.visible.sorted
  end

end
