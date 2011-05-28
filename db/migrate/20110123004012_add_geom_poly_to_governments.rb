class AddGeomPolyToGovernments < ActiveRecord::Migration
  def self.up
    add_column :governments, :geom, :geometry, :srid =>4326
  end

  def self.down
    remove_column :governments, :geom
  end
end
