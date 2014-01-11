class WorkoutsConstructorController < ApplicationController

  def index
    @workouts_under_construction = Workout.where({creator_id: current_user.id, status: "under_construction"})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workouts }
    end
  end

end