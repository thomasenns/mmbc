class AddBeginAndEndTextStringsToRoutes < ActiveRecord::Migration
  def self.up
  	add_column :routes, :begin_text, :string
  	add_column :routes, :end_text, :string
  end

  def self.down
  	remove_column :routes, :begin_text
  	remove_column :routes, :end_text
  end
end
