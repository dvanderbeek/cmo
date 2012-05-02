class Block < ActiveRecord::Base
  belongs_to :col
  acts_as_list :scope => :col
end
