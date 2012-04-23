class UpdateLayoutId < ActiveRecord::Migration
  def self.up
     change_column :sites, :layout_id, :integer, :default => 1, :null => false
  end
end