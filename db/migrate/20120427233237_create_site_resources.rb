class CreateSiteResources < ActiveRecord::Migration
  def change
    create_table :site_resources do |t|
      t.string :name
      t.references :site
      t.string :type
      t.integer :position

      t.timestamps
    end
    add_index :site_resources, :site_id
  end
end
