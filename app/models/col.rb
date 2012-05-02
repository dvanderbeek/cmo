class Col < ActiveRecord::Base
  belongs_to :row
  acts_as_list :scope => :row
  has_many :blocks, :order => "position", :dependent => :destroy
end