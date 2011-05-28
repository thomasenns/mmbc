class AddGoogleToSections < ActiveRecord::Migration
  def self.up
  	add_column :sections, :distance, :string
  	add_column :sections, :duration, :string
  	add_column :sections, :end_location, :string
  	add_column :sections, :instructions, :string
  	add_column :sections, :start_location, :string
  	add_column :sections, :travel_mode, :string	
  end

  def self.down
  	remove_column :sections, :distance
  	remove_column :sections, :duration
  	remove_column :sections, :end_location
  	remove_column :sections, :instructions
  	remove_column :sections, :start_location
  	remove_column :sections, :travel_mode
  end
end
