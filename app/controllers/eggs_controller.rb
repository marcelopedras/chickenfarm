class EggsController < ApplicationController
  # GET /eggs
  # GET /eggs.json
  def index
    @chicken = Chicken.find params[:chicken_id]
    @eggs = @chicken.eggs

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eggs }
    end
  end

  # GET /eggs/1
  # GET /eggs/1.json
  def show
    @egg = Egg.find(params[:id])
    @chicken = @egg.chicken

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @egg }
    end
  end

  # GET /eggs/new
  # GET /eggs/new.json
  def new
    @egg = Egg.new
    @chicken = Chicken.find params[:chicken_id]
    @egg.chicken = @chicken

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @egg }
    end
  end

  # GET /eggs/1/edit
  def edit
    @egg = Egg.find(params[:id])
    @chicken = @egg.chicken
  end

  # POST /eggs
  # POST /eggs.json
  def create
    @egg = Egg.new(params[:egg])
    @chicken = Chicken.find params[:chicken_id]

    respond_to do |format|
      if @egg.save
        format.html { redirect_to [@chicken,@egg], notice: 'Egg was successfully created.' }
        format.json { render json: @egg, status: :created, location: @egg }
      else
        format.html { render action: "new" }
        format.json { render json: @egg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eggs/1
  # PUT /eggs/1.json
  def update
    @egg = Egg.find(params[:id])
    @chicken = @egg.chicken

    respond_to do |format|
      if @egg.update_attributes(params[:egg])
        format.html { redirect_to [@chicken,@egg], notice: 'Egg was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @egg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eggs/1
  # DELETE /eggs/1.json
  def destroy
    @egg = Egg.find(params[:id])
    @egg.destroy

    respond_to do |format|
      format.html { redirect_to chicken_eggs_url}
      format.json { head :no_content }
    end
  end
end
