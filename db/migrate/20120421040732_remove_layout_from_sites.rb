class RemoveLayoutFromSites < ActiveRecord::Migration
  def up
    remove_column :sites, :layout
    remove_column :sites, :custom_layout_content
  end

  def down
    add_column :sites, :layout, :string
    add_column :sites, :custom_layout_content, :text
  end
end
