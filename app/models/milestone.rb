class Milestone < ActiveRecord::Base
	belongs_to :child
	validates_presence_of :name, :child
	
	def self.find_distinct_milestones
	  data = self.select("DISTINCT(name)")
	end
end
