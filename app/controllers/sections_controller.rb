class SectionsController < ApplicationController
    
  layout "admin"

  before_action :confirm_logged_in


  before_action :find_page

  def index
    @sections = Section.where(:page_id=>@page.id).sorted
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice]="The section has been successfully destroyed."
    redirect_to(:action=>'index', :page_id =>@page.id)
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count 
    @pages = Page.order('position ASC')
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice]="Section successfully updated!"
      redirect_to(:action=>'index', :page_id=>@page.id)
    else
      # have to provide the instance variables again for the render 
      @pages = Page.order('position ASC')
      @section_count = Section.count
      render('edit')
    end
  end

  def new
    @pages = Page.order('position ASC')
    @section = Section.new({:page_id => @page.id, :name=>"Default"})
    @section_count = Section.count + 1
  end
  
  def create
    @section = Section.new(section_params)
    if @section.save 
      flash[:notice] = "New section created."
      redirect_to(:action=>'index', :page_id=>@page.id)
    else
      @pages = Page.order('position ASC')
      @section_count = Section.count + 1
      render('new')
    end
  end

  def show
    @section = Section.find(params[:id])
  end

  private
    def section_params
      params.require(:section).permit(:name, :position, :visible, :content_type, :content, :page_id)
    end

    def find_page
      @page = Page.find(params[:page_id])
    end


end
