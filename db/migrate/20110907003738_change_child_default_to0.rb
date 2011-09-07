class ChangeChildDefaultTo0 < ActiveRecord::Migration
  def self.up
    change_column :milestones, :child_id, :integer, :default => 0
  end

  def self.down
    change_column :milestones, :child_id, :integer
  end
end
