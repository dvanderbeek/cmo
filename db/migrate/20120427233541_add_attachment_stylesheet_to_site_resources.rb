class AddAttachmentStylesheetToSiteResources < ActiveRecord::Migration
  def self.up
    add_column :site_resources, :stylesheet_file_name, :string
    add_column :site_resources, :stylesheet_content_type, :string
    add_column :site_resources, :stylesheet_file_size, :integer
    add_column :site_resources, :stylesheet_updated_at, :datetime

    add_column :site_resources, :javascript_file_name, :string
    add_column :site_resources, :javascript_content_type, :string
    add_column :site_resources, :javascript_file_size, :integer
    add_column :site_resources, :javascript_updated_at, :datetime

    add_column :site_resources, :file_file_name, :string
    add_column :site_resources, :file_content_type, :string
    add_column :site_resources, :file_file_size, :integer
    add_column :site_resources, :file_updated_at, :datetime
  end

  def self.down
    remove_column :site_resources, :stylesheet_file_name
    remove_column :site_resources, :stylesheet_content_type
    remove_column :site_resources, :stylesheet_file_size
    remove_column :site_resources, :stylesheet_updated_at

    remove_column :site_resources, :javascript_file_name
    remove_column :site_resources, :javascript_content_type
    remove_column :site_resources, :javascript_file_size
    remove_column :site_resources, :javascript_updated_at

    remove_column :site_resources, :file_file_name
    remove_column :site_resources, :file_content_type
    remove_column :site_resources, :file_file_size
    remove_column :site_resources, :file_updated_at
  end
end
