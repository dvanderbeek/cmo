class AddResourceUrlToSiteResources < ActiveRecord::Migration
  def change
    add_column :site_resources, :resource_url, :string

  end
end
