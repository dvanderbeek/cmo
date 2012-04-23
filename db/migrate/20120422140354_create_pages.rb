class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.integer :order
      t.integer :parent
      t.text :content
      t.string :seo_title
      t.text :seo_meta
      t.text :seo_keywords
      t.references :site

      t.timestamps
    end
    add_index :pages, :site_id
  end
end
