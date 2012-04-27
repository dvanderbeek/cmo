class ChangePageContentDefault < ActiveRecord::Migration
  def change
    change_column_default(:pages, :content, '')
  end

end
