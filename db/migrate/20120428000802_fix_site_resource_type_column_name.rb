class FixSiteResourceTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :site_resources, :type, :resource_type
  end
end
