class Milestone < ActiveRecord::Base
	validates_presence_of :name
	
	def self.find_distinct_milestones
	  data = self.select("DISTINCT(name)")
	end
end
