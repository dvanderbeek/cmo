class Row < ActiveRecord::Base
  belongs_to :page
  acts_as_list :scope => :page
  has_many :cols, :order => "position", :dependent => :destroy
  has_many :blocks, :through => :cols
  scope :not_parent, :conditions => "id NOT IN (SELECT DISTINCT row_id FROM cols WHERE row_id IS NOT NULL)"

end
