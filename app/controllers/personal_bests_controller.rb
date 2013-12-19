class PersonalBestsController < ApplicationController
  # GET /personal_bests
  # GET /personal_bests.json
  def index
    @personal_bests = PersonalBest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personal_bests }
    end
  end

  # GET /personal_bests/1
  # GET /personal_bests/1.json
  def show
    @personal_best = PersonalBest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @personal_best }
    end
  end

  # GET /personal_bests/new
  # GET /personal_bests/new.json
  def new
    @personal_best = PersonalBest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @personal_best }
    end
  end

  # GET /personal_bests/1/edit
  def edit
    @personal_best = PersonalBest.find(params[:id])
  end

  # POST /personal_bests
  # POST /personal_bests.json
  def create
    @personal_best = PersonalBest.new(params[:personal_best])

    respond_to do |format|
      if @personal_best.save
        format.html { redirect_to @personal_best, notice: 'Personal best was successfully created.' }
        format.json { render json: @personal_best, status: :created, location: @personal_best }
      else
        format.html { render action: "new" }
        format.json { render json: @personal_best.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /personal_bests/1
  # PUT /personal_bests/1.json
  def update
    @personal_best = PersonalBest.find(params[:id])

    respond_to do |format|
      if @personal_best.update_attributes(params[:personal_best])
        format.html { redirect_to @personal_best, notice: 'Personal best was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @personal_best.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_bests/1
  # DELETE /personal_bests/1.json
  def destroy
    @personal_best = PersonalBest.find(params[:id])
    @personal_best.destroy

    respond_to do |format|
      format.html { redirect_to personal_bests_url }
      format.json { head :no_content }
    end
  end
end
