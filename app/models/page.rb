class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history, :use => :scoped, :scope => :site
  belongs_to :site
  has_many :rows, :order => "position", :dependent => :destroy

  #acts_as_list
  liquid_methods :title, :slug, :seo_title
end
