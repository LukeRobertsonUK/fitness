class ExerciseInstructionsController < ApplicationController
  # GET /exercise_instructions
  # GET /exercise_instructions.json
  def index
    @exercise_instructions = ExerciseInstruction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exercise_instructions }
    end
  end

  # GET /exercise_instructions/1
  # GET /exercise_instructions/1.json
  def show
    @exercise_instruction = ExerciseInstruction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exercise_instruction }
    end
  end

  # GET /exercise_instructions/new
  # GET /exercise_instructions/new.json
  def new
    @exercise_instruction = ExerciseInstruction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exercise_instruction }
    end
  end

  # GET /exercise_instructions/1/edit
  def edit
    @exercise_instruction = ExerciseInstruction.find(params[:id])
  end

  # POST /exercise_instructions
  # POST /exercise_instructions.json
  def create
    @exercise_instruction = ExerciseInstruction.new(params[:exercise_instruction])

    respond_to do |format|
      if @exercise_instruction.save
        format.html { redirect_to @exercise_instruction, notice: 'Exercise instruction was successfully created.' }
        format.json { render json: @exercise_instruction, status: :created, location: @exercise_instruction }
      else
        format.html { render action: "new" }
        format.json { render json: @exercise_instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exercise_instructions/1
  # PUT /exercise_instructions/1.json
  def update
    @exercise_instruction = ExerciseInstruction.find(params[:id])

    respond_to do |format|
      if @exercise_instruction.update_attributes(params[:exercise_instruction])
        format.html { redirect_to @exercise_instruction, notice: 'Exercise instruction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exercise_instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_instructions/1
  # DELETE /exercise_instructions/1.json
  def destroy
    @exercise_instruction = ExerciseInstruction.find(params[:id])
    @exercise_instruction.destroy

    respond_to do |format|
      format.html { redirect_to exercise_instructions_url }
      format.json { head :no_content }
    end
  end
end
