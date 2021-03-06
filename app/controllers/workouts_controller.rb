class WorkoutsController < ApplicationController
  # GET /workouts
  # GET /workouts.json
  def index
      @outstanding_workouts = Workout.where({user_id: current_user.id, status: "released"}).order('due_date')
      @completed_workouts = Workout.where({user_id: current_user.id, status: "complete"}).order('completion_date DESC')



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workouts }
    end
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
    @workout = Workout.find(params[:id])

    @records = @workout.components.map {|component| [component.notes, component.weight_records]}.flatten.compact

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workout }
    end
  end

  # GET /workouts/new
  # GET /workouts/new.json
  def new
    @workout = Workout.new(user_id: params[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workout }
    end
  end

  # GET /workouts/1/edit
  def edit
    @workout = Workout.find(params[:id])
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout = Workout.new(params[:workout])
    @workout.creator_id = current_user.id
    @workout.status = "under_construction"
    @workout.snooze_count = 0

    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render json: @workout, status: :created, location: @workout }
      else
        format.html { render action: "new" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workouts/1
  # PUT /workouts/1.json
  def update
    @workout = Workout.find(params[:id])

    respond_to do |format|
      if @workout.update_attributes(params[:workout])
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to workouts_url }
      format.json { head :no_content }
    end
  end

  def release
    @workout = Workout.find(params[:id])
    if @workout.status == "under_construction"
      @workout.make_released
      redirect_to @workout, notice: 'Workout has been released from the Constructor and is now visible to the trainee.'
    else
      @workout.mark_uncompleted
      redirect_to @workout, notice: 'Workout has been marked as incomplete.'
    end
  end

  def complete
    @workout = Workout.find(params[:id])
    @workout.mark_completed
    @workout.save!
    redirect_to @workout, notice: 'Workout has been marked as complete!'
  end

  def make_under_construction
    @workout = Workout.find(params[:id])
    @workout.make_under_construction
    redirect_to @workout, notice: 'Workout has been moved to the Constructor and is no longer visible to the trainee.'
  end

end


