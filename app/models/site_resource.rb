class SiteResource < ActiveRecord::Base
  belongs_to :site

  has_attached_file :resource

end