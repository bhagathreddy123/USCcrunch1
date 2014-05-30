class TeachersController < ApplicationController
  layout :get_school_layout, :except => ['edit', 'update']

  def showattendance
    @class = SchoolClass.find(params[:school_class_id])
    @attendances = Attendance.where("school_class_id = #{@class.id}")
    
  end
  
  def attendence
    @school = SchoolClass.find(params[:class_id])
    if params[:attendance]
      params[:attendance].to_a.each do |att|
        date = att.split(",")[0].to_date
        stu = att.split(",")[1].to_i
        cls = StudentClass.find_by_user_id(stu)
        attendance = Attendance.new(:attendance_day => date,:user_id => stu,:school_class_id =>params[:class_id])
        attendance.save
      end
    end
    redirect_to showattendance_school_teachers_path(:school_class_id=>@school)
  end  
  
  def classstudents
    @school = SchoolClass.find(params[:class_id])
    @students = StudentClass.where(:school_class_id=>@school.id)
    for stu in @students
      puts "FSDSDFGDGDFGDG"
      puts stu.user_id
      puts "FFSGGFGFDGDFGFDGFDG"
    end
  end
  
  def search
    @users = User.where("first_name LIKE '#{params[:first_name]}'")
    render :action => 'index'
  end
  
  def index
    @users = User.where("role = 'teacher'")
    # @school = SchoolAdmin.find(params[:school_id])
    @school = SchoolAdmin.find_by_slug!(params[:school_id])
  end
  
  def new
    @school = SchoolAdmin.find_by_slug!(params[:school_id])
    @teacher = @school.users.new
  end
  
  def create
    @school = SchoolAdmin.find_by_slug!(params[:school_id])
    @teacher = @school.users.new(params[:user])
    @teacher.password = 'ashok123'
    @teacher.password_confirmation = 'ashok123'
    @teacher.role = 'teacher'
    @teacher.generate_password_reset_code
    if @teacher.save
      
      TeacherClass.create(:user_id=>@teacher.id,:school_class_id=>params[:school_class_id],:subject_id=>params[:subject_id])
      #      @teacher.update_attribute(:confirmation_token,nil)
      puts ">>>>>>>"
      puts @teacher.errors.to_a
      flash[:notice] = "Sccessfully Send invitation to student"
      UserMailer.sent_teacher_invitation(@school,@teacher).deliver
      redirect_to school_path(@school)
    else
      flash[:error] = "Failed to Send Invitation"
      render :action => 'new'
    end
  end
  
  def edit
    @teacher = User.find(params[:id])
    if @teacher.reset_password_token != params[:reset_password_token]
      render :text => 'Invalid Token.',:layout => false
    end
  end
  
  def show
    @school = SchoolAdmin.find(params[:school_id])
    @user = User.find(params[:id])
    @posts = Tweet.where("user_id = '#{@user.id}' and reply IS NULL").order("created_at Desc").paginate :page => params[:page], :per_page => 10
    respond_to do |format|
      format.html {render :partial => "show", :layout => false if request.xhr?}
      format.js {render :partial => "show", :layout => false if request.xhr?}
    end
  end
  
  def update
    @teacher = User.find(params[:id])
    if @teacher.update_attributes(params[:user])
      @teacher.update_attribute(:reset_password_token,nil)
      @teacher.update_attribute(:confirmation_token,nil)
      sign_in(@teacher, @teacher)
      redirect_to new_user1_home_path(current_user)
    else
      flash.now[:error] = "Loggened in failed."
      render :action => 'edit'
    end
  end
  
  def destroy
    @teacher = User.find(params[:id])
    if @teacher.destroy
      render :update do |page|
        flash[:notice] = "Successfully deleted this #{@teacher.role}."
        page.reload
      end
    end
  end
end
