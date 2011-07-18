class CreateMilestones < ActiveRecord::Migration
  def self.up
    create_table :milestones do |t|
      t.string :name, :null => false
      t.text :description
      t.string :file_link
      t.integer :posts_to_facebook
      t.integer :posts_to_twitter

      t.timestamps
    end
  end

  def self.down
    drop_table :milestones
  end
end
