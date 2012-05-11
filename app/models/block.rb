class Block < ActiveRecord::Base
  before_destroy :get_parent
  after_destroy :destroy_orphaned_parent

  belongs_to :col
  acts_as_list :scope => :col

  private
    def get_parent
      @parent_id = self.col_id
    end
    def destroy_orphaned_parent
      @col = Col.find(@parent_id)
      @row = @col.row
      if @col.blocks.count == 0
        @col.destroy
      end
      if @row.cols.count == 0
        @row.destroy
      end
    end

end
