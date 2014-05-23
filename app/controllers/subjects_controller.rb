class SubjectsController < ApplicationController
layout :get_school_layout
  def index
    @subject = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def create
    @subject = Subject.new(params[:subject])
    if  @subject.save
      flash[:notice] = "subject has been created successfully"
      redirect_to  school_class_subjects_path
    else
      render :new
    end
  end
  
  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      flash[:notice] = "subject has been updatedted successfully"
      redirect_to  school_class_subjects_path
    else
      render :edit
    end
  end
  
  def show
    @subject = Subject.find(params[:id])
  end
  
  def destroy
    @subject = Subject.find(params[:id])
   if  @subject.destroy
    redirect_to school_class_subjects_path
   end
  end
end

