class StationsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.find(:all, order: japanese? ? "kana" : "ascii")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stations }
    end
  end

  # GET /stations/tokyo
  # GET /stations/tokyo.json
  def show
    @station = Station.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @station }
    end
  end

  # GET /stations/new
  # GET /stations/new.json
  def new
    @station = Station.new
    5.times { @station.stops.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @station }
    end
  end

  # GET /stations/tokyo/edit
  def edit
    @station = Station.find_by_slug(params[:id])
    5.times { @station.stops.build }
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(params[:station])

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render json: @station, status: :created, location: @station }
      else
        format.html { render action: "new" }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stations/tokyo
  # PUT /stations/tokyo.json
  def update
    @station = Station.find_by_slug(params[:id])

    respond_to do |format|
      if @station.update_attributes(params[:station])
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/tokyo
  # DELETE /stations/tokyo.json
  def destroy
    @station = Station.find_by_slug(params[:id])
    @station.destroy

    respond_to do |format|
      format.html { redirect_to stations_url }
      format.json { head :ok }
    end
  end
end
