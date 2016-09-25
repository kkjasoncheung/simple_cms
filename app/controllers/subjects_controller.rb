class SubjectsController < ApplicationController
    
  # In this controller is where all the CRUD for the model Subjects goes
  # typically want 1 controller per model
  #layout false
  layout "admin"

  before_action :confirm_logged_in 

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    # adds default values
    @subject = Subject.new({:name=>"Default"})
    @subject_count = Subject.count+1
  end

  def create
    # Instantiate a new object using form parameters
    # subject_params passes all params of the object

    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Subject created successfully."
      redirect_to(:action=>'index')

    else
      # If save fails, redisplay the form so user can fix problem
      @subject_count = Subject.count+1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    # Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    # updates the attributes, by passing in the mass assignment priviledges
    # if the update is successful, then redirect to the index page
    # subject_params passes all params of the object
    if @subject.update_attributes(subject_params)
        flash[:notice] = "Subject updated successfully."
        redirect_to(:action=>'show', :id=> @subject.id)
    else 
      # want to make sure that all instance variables required for the template are available at RENDER
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject: '#{subject.name}' destroyed successfully."
    redirect_to(:action=>'index')
  end

  private 
    def subject_params
      # same as using "params[:subject]", except that it:
      # -raises an error if :subject is not present
      # -allows listed attributes to be mass-assigned 
      params.require(:subject).permit(:name, :position, :visible)
    end

end
