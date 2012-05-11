class Site < ActiveRecord::Base
  belongs_to :user
  belongs_to :layout
  has_many :pages, :order => "position", :dependent => :destroy
  has_many :site_resources, :order => "position", :dependent => :destroy
  validates_uniqueness_of :subdomain
  liquid_methods :title, :subdomain, :seo_title, :seo_meta, :seo_keywords, :pages, :google_analytics

  has_attached_file :favicon, :styles => { :icon => "16x16>" }

end
