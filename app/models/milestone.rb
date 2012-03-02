class Milestone < ActiveRecord::Base
	belongs_to :child
	validates_presence_of :name, :child, :milestone_date
	
	# TODO - add validation and defaults on date
	
	def self.find_distinct_milestones
	  data = self.select("DISTINCT(name)")
	end
end
