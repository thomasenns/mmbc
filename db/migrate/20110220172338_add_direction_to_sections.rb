class AddDirectionToSections < ActiveRecord::Migration
  def self.up
  	add_column :sections, :direction, :string
  end

  def self.down
  	remove_column :sections, :direction
  end
end
