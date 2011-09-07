class AddChildToMilestones < ActiveRecord::Migration
  def self.up
    add_column :milestones, :child_id, :integer
  end

  def self.down
    remove_column :milestones, :child_id
  end
end
