class CreateTimeLines < ActiveRecord::Migration
  def self.up
    create_table :time_lines do |t|
      t.integer :id
      t.date :year
      t.date :month
      t.date :day
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end

  def self.down
    drop_table :time_lines
  end
end
