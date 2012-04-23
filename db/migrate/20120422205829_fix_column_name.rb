class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :pages, :sequence, :position
  end
end
