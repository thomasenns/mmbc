class AddDescriptionToRoutes < ActiveRecord::Migration
  def self.up
  	add_column :routes, :description, :string
  end

  def self.down
  	remove_column  :routes, :description
  end
end
