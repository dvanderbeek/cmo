class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title
      t.string :subdomain
      t.string :seo_title
      t.text :seo_meta
      t.text :seo_keywords
      t.text :robots
      t.string :layout, :default => "custom"
      t.text :custom_layout_content
      t.references :user

      t.timestamps
    end
    add_index :sites, :user_id
  end
end
