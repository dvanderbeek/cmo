class Row < ActiveRecord::Base
  belongs_to :page
  acts_as_list :scope => :page
  has_many :cols, :order => "position", :dependent => :destroy
end
