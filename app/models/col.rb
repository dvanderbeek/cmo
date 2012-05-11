class Col < ActiveRecord::Base
  belongs_to :row
  acts_as_list :scope => :row
  has_many :blocks, :order => "position", :dependent => :destroy
  scope :not_parent, :conditions => "id NOT IN (SELECT DISTINCT col_id FROM blocks WHERE col_id IS NOT NULL)"

end