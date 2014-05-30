class StudentClass < ActiveRecord::Base
  attr_accessible :user_id, :school_class_id
  belongs_to :user
  belongs_to :school_class
end

