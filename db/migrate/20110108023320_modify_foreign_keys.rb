class ModifyForeignKeys < ActiveRecord::Migration
  def self.up
    remove_column :routes, :user_id
    add_column :routes, :users_id, :integer
    
    remove_column :sections, :user_id
    add_column :sections, :routes_id, :integer
    remove_column :sections, :gov_id
    add_column :sections, :governments_id, :integer
    
    add_column :time_lines, :routes_id, :integer
  end

  def self.down
    add_column :routes, :user_id, :integer
    remove_column :routes, :users_id
    
    add_column :sections, :user_id, :integer
    remove_column :sections, :routes_id
    add_column :sections, :gov_id, :integer
    remove_column :sections, :governments_id
    
    remove_column :time_lines, :routes_id
  end
end
