class AddLayoutIdToSites < ActiveRecord::Migration
  def change
    change_table :sites do |t|
      t.references :layout
    end
  end
end
