class TeacherClass < ActiveRecord::Base
 attr_accessible :user_id, :school_class_id,:subject_id
   belongs_to :user
   belongs_to :school_class
  belongs_to :subject
end




