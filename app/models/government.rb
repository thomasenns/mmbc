class Government < ActiveRecord::Base
  has_many :sections, :foreign_key => "governments_id", :dependent => :destroy
end
