class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.integer :id
      t.integer :user_id
      t.binary :sections
      t.binary :time_lines
      t.binary :start_xy
      t.binary :finish_xy
      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
