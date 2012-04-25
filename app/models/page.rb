class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history
  belongs_to :site
  #acts_as_list
  liquid_methods :title, :slug, :seo_title
end
