class AddNameToSections < ActiveRecord::Migration
  def self.up
   add_column :sections, :name, :string
  end

  def self.down
   remove_column  :sections, :name
  end
end
