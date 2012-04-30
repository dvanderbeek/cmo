class CreateCols < ActiveRecord::Migration
  def change
    create_table :cols do |t|
      t.references :row
      t.integer :col_width
      t.integer :position

      t.timestamps
    end
    add_index :cols, :row_id
  end
end
