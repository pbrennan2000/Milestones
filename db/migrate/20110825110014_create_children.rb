class CreateChildren < ActiveRecord::Migration
  def self.up
    create_table :children do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name

      t.timestamps
    end
  end

  def self.down
    drop_table :children
  end
end
