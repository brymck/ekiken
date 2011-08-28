class CompaniesController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.find(:all, order: japanese? ? "kana" : "ascii")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/jr-east
  # GET /companies/jr-east.json
  def show
    @company = Company.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new
    12.times { @company.lines.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/jr-east/edit
  def edit
    @company = Company.find_by_slug(params[:id])
    12.times { @company.lines.build }
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/jr-east
  # PUT /companies/jr-east.json
  def update
    @company = Company.find_by_slug(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/jr-east
  # DELETE /companies/jr-east.json
  def destroy
    @company = Company.find_by_slug(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :ok }
    end
  end
end
