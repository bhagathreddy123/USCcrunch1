class SchoolClassesController < ApplicationController
  layout :get_school_layout
  def index
    @schoolclass = SchoolClass.all
  end

  def new
    @schoolclass = SchoolClass.new
  end

  def create
    @schoolclass = SchoolClass.new(params[:school_class])
    if  @schoolclass.save
      flash[:notice] = "class has been created successfully"
      redirect_to  school_classes_path
    else
      render :new
    end
  end
  
  def update
    @schoolclass = SchoolClass.find(params[:id])
    if @schoolclass.update_attributes(params[:school_class])
      flash[:notice] = "school class has been updatedted successfully"
      redirect_to  school_classes_path
    else
      render :edit
    end
  end
   
  def show
    @schoolclass = SchoolClass.find(params[:id])
  end

  def edit
    @schoolclass = SchoolClass.find(params[:id])
  end
  
  
  def destroy
    @schoolclass = SchoolClass.find(params[:id])
    if  @schoolclass.destroy
      redirect_to school_classes_path
    end
  end
  
  
end
