class Child < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  has_many :milestones, :dependent => :destroy
end
