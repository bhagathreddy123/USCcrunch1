class SchoolClass < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible  :name,:description
  has_many :subjects,:dependent => :destroy
  belongs_to :school_admin
  belongs_to :user
  end
