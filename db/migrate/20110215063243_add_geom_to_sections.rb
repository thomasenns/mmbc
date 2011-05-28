class AddGeomToSections < ActiveRecord::Migration
  def self.up
  	add_column :sections, :geom, :geometry, :srid =>4326
  end

  def self.down
  	remove_column :sections, :geom
  end
end
