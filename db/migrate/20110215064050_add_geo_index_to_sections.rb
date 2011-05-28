class AddGeoIndexToSections < ActiveRecord::Migration
  def self.up
  	 add_index :sections, :geom, :spatial=>true
  end

  def self.down
  end
end
