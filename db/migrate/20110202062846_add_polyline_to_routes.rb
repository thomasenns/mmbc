class AddPolylineToRoutes < ActiveRecord::Migration
  def self.up
	add_column :routes, :geom, :geometry, :srid =>4326
  end

  def self.down
 	remove_column :routes, :geom
  end
end
