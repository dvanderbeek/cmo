class SiteResource < ActiveRecord::Base
  belongs_to :site
  has_attached_file :resource
  scope :css, where(:resource_content_type => 'text/css')
  scope :js, where(:resource_content_type => 'application/x-javascript')

end