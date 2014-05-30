class Subject < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :subjectname,:user_id, :school_class_id
  belongs_to :school_class
  belongs_to :school_admin
  belongs_to :user
  has_many :teacher_classes
end


