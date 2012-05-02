class RowsController < ApplicationController
  # POST /rows
  # POST /rows.json
  def create
    @page = Page.find(params[:row][:page_id])
    @row = Row.new(params[:row])
    @col = @row.cols.build(:col_width => 12, :position => 1)

    respond_to do |format|
      if @row.save
        format.html { redirect_to @row, notice: 'Row was successfully created.' }
        format.js
        format.json { render json: @row, status: :created, location: @row }
      else
        format.html { render action: "new" }
        format.json { render json: @row.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rows/1
  # DELETE /rows/1.json
  def destroy
    @row = Row.find(params[:id])
    @row.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
      format.json { head :no_content }
    end
  end

  def sort
    params[:row].each_with_index do |id, index|
      Row.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
