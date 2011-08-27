class RoutesController < ApplicationController
  # GET /routes
  # GET /routes.json
  def index
    @routes = Line.find_by_slug(params[:line_id]).routes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @routes }
    end
  end

  # GET /routes/1
  # GET /routes/1.json
  def show
    @route = Line.find_by_slug(params[:line_id]).routes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @route }
    end
  end

  # GET /routes/new
  # GET /routes/new.json
  def new
    @route = Route.new
    @route.line = Line.find_by_slug(params[:line_id])

    30.times { @route.route_stops.build }
    @route.order_stops params[:order] if params[:order]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @route }
    end
  end

  # GET /routes/1/edit
  def edit
    @route = Line.find_by_slug(params[:line_id]).routes.find(params[:id])

    30.times { @route.route_stops.build }
    @route.order_stops params[:order] if params[:order]
  end

  # POST /routes
  # POST /routes.json
  def create
    @route = Route.new(params[:route])

    respond_to do |format|
      if @route.save
        format.html { redirect_to [@route.line, @route], notice: 'Route was successfully created.' }
        format.json { render json: @route, status: :created, location: @route }
      else
        format.html { render action: "new" }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /routes/1
  # PUT /routes/1.json
  def update
    @route = Line.find_by_slug(params[:line_id]).routes.find(params[:id])

    respond_to do |format|
      if @route.update_attributes(params[:route])
        format.html { redirect_to [@route.line, @route], notice: 'Route was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
    @route = Line.find_by_slug(params[:line_id]).routes.find(params[:id])
    @route.destroy

    respond_to do |format|
      format.html { redirect_to routes_url }
      format.json { head :ok }
    end
  end
end
