class Attendance < ActiveRecord::Base
  attr_accessible :user_id, :school_class_id,:attendance_day
  belongs_to :user
  belongs_to :school_class
  validates :attendance_day, :uniqueness => {:scope => :user_id}
end