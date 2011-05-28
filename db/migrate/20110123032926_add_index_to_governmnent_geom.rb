class AddIndexToGovernmnentGeom < ActiveRecord::Migration
  def self.up
  	add_index :governments, :geom, :spatial=>true
  end

  def self.down
  end
end
