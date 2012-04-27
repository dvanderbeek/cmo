class AddCustomLayoutContentToSites < ActiveRecord::Migration
  def change
    add_column :sites, :custom_layout_content, :text

  end
end
