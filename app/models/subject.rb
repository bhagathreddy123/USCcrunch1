class Subject < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :subjectname
  belongs_to :school_class
  belongs_to :school_admin
  belongs_to :user
end
