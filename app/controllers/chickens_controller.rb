class ChickensController < ApplicationController
  # GET /chickens
  # GET /chickens.json
  def index
    @farm = Farm.find(params[:farm_id])
    @chickens = @farm.chickens

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chickens }
    end
  end

  # GET /chickens/1
  # GET /chickens/1.json
  def show
    @chicken = Chicken.find(params[:id])
    @farm = Farm.find(params[:farm_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chicken }
      format.js {render action: 'show'}
    end
  end

  # GET /chickens/new
  # GET /chickens/new.json
  def new
    @farm = Farm.find params[:farm_id]
    @chicken = Chicken.new
    @chicken.farm = @farm

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chicken }
    end
  end

  # GET /chickens/1/edit
  def edit
    @chicken = Chicken.find(params[:id])
    @farm = @chicken.farm
  end

  # POST /chickens
  # POST /chickens.json
  def create
    @chicken = Chicken.new(params[:chicken])
    @farm = @chicken.farm

    respond_to do |format|
      if @chicken.save
        format.html { redirect_to [@farm, @chicken], notice: 'Chicken was successfully created.' }
        format.json { render json: @chicken, status: :created, location: @chicken }
      else
        format.html { render action: "new" }
        format.json { render json: @chicken.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chickens/1
  # PUT /chickens/1.json
  def update
    @chicken = Chicken.find(params[:id])
    @farm = @chicken.farm

    respond_to do |format|
      if @chicken.update_attributes(params[:chicken])
        format.html { redirect_to [@farm, @chicken], notice: 'Chicken was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chicken.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chickens/1
  # DELETE /chickens/1.json
  def destroy
    @chicken = Chicken.find(params[:id])
    @chicken.destroy

    respond_to do |format|
      format.html { redirect_to farm_chickens_url }
      format.json { head :no_content }
      format.js {render action: "destroy"}
    end
  end
end
