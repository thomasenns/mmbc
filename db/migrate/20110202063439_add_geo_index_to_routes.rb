class AddGeoIndexToRoutes < ActiveRecord::Migration
  def self.up
  	  add_index :routes, :geom, :spatial=>true
  end

  def self.down
  end
end
