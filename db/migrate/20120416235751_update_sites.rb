class UpdateSites < ActiveRecord::Migration
  def self.up
     change_column :sites, :layout, :string, :default => 'custom', :null => false
  end
end