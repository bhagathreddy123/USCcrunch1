class SchoolsController < ApplicationController
  before_filter :is_school?, :except => ['edit', 'update', 'destroy']
  layout :get_school_layout, :except => ['edit', 'update']
  def show
   @school = SchoolAdmin.find_by_slug!(params[:id])
    @students = User.where("school_admin_id = '#{current_school_admin.id}'").all
  end

  def edit
    @school = SchoolAdmin.find(params[:id])
    if @school.reset_password_token != params[:reset_password_token]
      render :text => 'Invalid Token.',:layout => false
    end
  end

  def update
    @school = SchoolAdmin.find_by_slug!(params[:id])
    if @school.update_attributes(params[:school_admin])
      @school.update_attribute(:reset_password_token,nil)
      redirect_to school_login_home_index_path
    else
      flash.now[:error] = "Loggened in failed."
      render :action => 'edit'
    end
  end

  def destroy
    @school = SchoolAdmin.find_by_slug!(params[:id])
    if @school.destroy
      render :update do |page|
        flash[:notice] = "Successfully deleted this school."
        page.reload
      end
    end
  end
end
