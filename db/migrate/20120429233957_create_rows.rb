class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.references :page
      t.integer :position

      t.timestamps
    end
    add_index :rows, :page_id
  end
end
