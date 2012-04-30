class Row < ActiveRecord::Base
  belongs_to :page
  has_many :cols, :order => "position", :dependent => :destroy
end
