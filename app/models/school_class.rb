class SchoolClass < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible  :name,:description,:user_id
  has_many :subjects,:dependent => :destroy
  belongs_to :school_admin
  has_many :attendances,:dependent => :destroy
  has_many :student_classes ,:dependent => :destroy
  has_many :teacher_classes,:dependent => :destroy
  belongs_to :user
end

