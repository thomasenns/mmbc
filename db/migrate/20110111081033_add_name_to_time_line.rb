class AddNameToTimeLine < ActiveRecord::Migration
  def self.up
   add_column :time_lines, :name, :string
  end

  def self.down
   remove_column  :time_lines, :name
  end
end
