class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.integer :id
      t.integer :gov_id
      t.integer :user_id
      t.boolean :complete
      t.string :side_street
      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
