class CreateGovernments < ActiveRecord::Migration
  def self.up
    create_table :governments do |t|
      t.integer :id
      t.string :name
      t.string :type
      t.boolean :center
      t.boolean :env
      t.timestamps
    end
  end

  def self.down
    drop_table :governments
  end
end
