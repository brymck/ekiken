class LinesController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  # GET /lines
  # GET /lines.json
  def index
    @lines = Line.find(:all, order: japanese? ? "kana" : "ascii")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lines }
    end
  end

  # GET /lines/1
  # GET /lines/1.json
  def show
    @line = Line.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line }
    end
  end

  # GET /lines/new
  # GET /lines/new.json
  def new
    @line = Line.new
    12.times { @line.stops.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line }
    end
  end

  # GET /lines/1/edit
  def edit
    @line = Line.find_by_slug(params[:id])
    12.times { @line.stops.build }
  end

  # POST /lines
  # POST /lines.json
  def create
    @line = Line.new(params[:line])

    respond_to do |format|
      if @line.save
        format.html { redirect_to @line, notice: 'Line was successfully created.' }
        format.json { render json: @line, status: :created, location: @line }
      else
        format.html { render action: "new" }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lines/1
  # PUT /lines/1.json
  def update
    @line = Line.find_by_slug(params[:id])

    respond_to do |format|
      if @line.update_attributes(params[:line])
        format.html { redirect_to @line, notice: 'Line was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lines/1
  # DELETE /lines/1.json
  def destroy
    @line = Line.find_by_slug(params[:id])
    @line.destroy

    respond_to do |format|
      format.html { redirect_to lines_url }
      format.json { head :ok }
    end
  end
end
