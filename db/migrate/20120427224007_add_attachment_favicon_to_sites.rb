class AddAttachmentFaviconToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :favicon_file_name, :string
    add_column :sites, :favicon_content_type, :string
    add_column :sites, :favicon_file_size, :integer
    add_column :sites, :favicon_updated_at, :datetime
  end

  def self.down
    remove_column :sites, :favicon_file_name
    remove_column :sites, :favicon_content_type
    remove_column :sites, :favicon_file_size
    remove_column :sites, :favicon_updated_at
  end
end
