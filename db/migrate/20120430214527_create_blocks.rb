class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.references :col
      t.text :content
      t.integer :position

      t.timestamps
    end
    add_index :blocks, :col_id
  end
end
