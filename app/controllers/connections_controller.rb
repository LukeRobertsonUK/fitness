class ConnectionsController < ApplicationController
  # GET /connections
  # GET /connections.json
  def index
    @connections_as_trainee = Connection.where({
        trainee_id: current_user.id,
        confirmed: true
      })

     @connections_as_trainer= Connection.where({
        trainer_id: current_user.id,
        confirmed: true
      })

    @connection_requests = Connection.where({
        trainer_id: current_user.id,
        confirmed: nil
      })


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @connections }
    end
  end

  # GET /connections/1
  # GET /connections/1.json
  def show
    @connection = Connection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @connection }
    end
  end

  # GET /connections/new
  # GET /connections/new.json
  def new
    @trainee = current_user
    @trainer = User.find(params[:trainer_id])
    @connection = Connection.new
    @connection.trainee_id = @trainee.id
    @connection.trainer_id = @trainer.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @connection }
    end
  end

  # GET /connections/1/edit
  def edit
    @connection = Connection.find(params[:id])
    @trainer = @connection.trainer
    @trainee = @connection.trainee
  end

  # POST /connections
  # POST /connections.json
  def create
    @connection = Connection.new(params[:connection])

    respond_to do |format|
      if @connection.save
        format.html { redirect_to @connection, notice: 'Your Connection Request was successfully sent.' }
        format.json { render json: @connection, status: :created, location: @connection }
      else
        format.html { render action: "new" }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /connections/1
  # PUT /connections/1.json
  def update
    @connection = Connection.find(params[:id])
    @connection.confirmed = true
    respond_to do |format|
      if @connection.update_attributes(params[:connection])
        format.html { redirect_to @connection, notice: 'Connection was successfully accepted.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connections/1
  # DELETE /connections/1.json
  def destroy
    @connection = Connection.find(params[:id])
    @connection.destroy

    respond_to do |format|
      format.html { redirect_to connections_url }
      format.json { head :no_content }
    end
  end

  def list_workouts
    @connection = Connection.find(params[:id])

    unless @connection.trainee == current_user
      @trainee = @connection.trainee if @connection.confirmed
      @trainer = @connection.trainer if @connection.confirmed
    end

    @outstanding_workouts = Workout.where({user_id: @trainee.id, creator_id: [@trainer.id, @trainee.id], status: "released"}).order('due_date')
    @completed_workouts =  Workout.where({user_id: @trainee.id, creator_id: [@trainer.id, @trainee.id], status: "complete"}).order('completion_date DESC')

    render 'workouts/index'

  end


end
