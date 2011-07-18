class AddAndUpdateMilestoneCols < ActiveRecord::Migration
  def self.up
	  add_column :milestones, :milestone_date, :date 
	  change_column :milestones, :posts_to_facebook, :integer, :default => 0
	  change_column :milestones, :posts_to_twitter, :integer, :default => 0
  end

  def self.down
	  remove_column :milestones, :milestone_date
	  change_column :milestones, :posts_to_facebook, :integer, :default => nil
	  change_column :milestones, :posts_to_twitter, :integer, :default => nil
  end
end
