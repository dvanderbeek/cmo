class AddTitleToLayout < ActiveRecord::Migration
  def change
    add_column :layouts, :title, :string

  end
end
