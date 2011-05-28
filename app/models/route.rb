class Route < ActiveRecord::Base
	
	serialize :description
	serialize :start_xy

	belongs_to :users
	has_many :sections, :foreign_key => "routes_id", :autosave => true, :dependent => :destroy
	has_many :time_lines, :foreign_key => "routes_id", :dependent => :destroy
end

