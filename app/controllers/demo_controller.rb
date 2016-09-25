class DemoController < ApplicationController
  
  layout 'application'
  
  def index
  	@id = params[:id].to_i
  	@page = params[:page].to_i
  end

  def hello
  	# render('index')
  	@array = [1,2,3,4,5]
  	@id = params['id'].to_i
  	@page = params[:page].to_i


  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end

  def lynda
  	redirect_to('http://lynda.com')
  end

  def page1
   	render('index')
  end 

  def logging
    logger.debug("This is debug")
    logger.info("This is info")
    logger.warn("This is warn")
    logger.error("This is error")
    logger.fatal("This is fatal")
    render(:text=>'Logged!')
  end
  

  def make_error
    # 3 Most common errors:
    #render(:text=>'test' # syntax error
    # render(:text=> @something.upcase) #undefined method since @something has no value AKA has nil value
    # render(:text=>"1" + 1) # can't convert code
  end

end
