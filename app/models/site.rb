class Site < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :subdomain
end
