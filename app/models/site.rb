class Site < ActiveRecord::Base
  belongs_to :user
  belongs_to :layout
  has_many :pages, :order => "position"
  validates_uniqueness_of :subdomain
  liquid_methods :title, :subdomain, :seo_title, :seo_meta, :seo_keywords, :pages
end
