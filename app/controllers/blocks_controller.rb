class BlocksController < ApplicationController
  # GET /blocks
  # GET /blocks.json
  def index
    @blocks = Block.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blocks }
    end
  end

  # GET /blocks/1
  # GET /blocks/1.json
  def show
    @block = Block.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @block }
    end
  end

  # GET /blocks/new
  # GET /blocks/new.json
  def new
    @block = Block.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @block }
    end
  end

  # GET /blocks/1/edit
  def edit
    @block = Block.find(params[:id])
  end

  # POST /blocks
  # POST /blocks.json
  def create
    if params[:col_id]
      params[:block][:col_id] = params[:col_id]
    end

    @col = Col.find(params[:block][:col_id])
    @page = @col.row.page

    params[:block][:content] = "click to start typing..."
    @block = Block.new(params[:block])

    respond_to do |format|
      if @block.save
        format.html { redirect_to @block, notice: 'Block was successfully created.' }
        format.js   { render 'rows/create.js' }
        format.json { render json: @block, status: :created, location: @block }
      else
        format.html { render action: "new" }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blocks/1
  # PUT /blocks/1.json
  def update
    @block = Block.find(params[:id])
    @page = @block.col.row.page

    respond_to do |format|
      if @block.update_attributes(params[:block])
        format.html { redirect_to @block, notice: 'Block was successfully updated.' }
        format.js   { render 'rows/create.js' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_all
    params.each do |id, content|
      Block.update_all({content: content}, {id: id})
    end
    render nothing: true
  end

  # DELETE /blocks/1
  # DELETE /blocks/1.json
  def destroy
    @block = Block.find(params[:id])
    @page = @block.col.row.page
    @block.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def sort
    if !params[:block].nil?
      params[:block].each_with_index do |id, index|
        Block.update_all({position: index+1, col_id: params[:col]}, {id: id})
      end
    end

    @col = Col.find(params[:col][0])
    @page = @col.row.page

    Col.not_parent.each do |col|
      col.destroy
    end
    Row.not_parent.each do |row|
      row.destroy
    end

    respond_to do |format|
      format.js   { render 'rows/create.js' }
    end

  end
end
