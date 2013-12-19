require 'test_helper'

class ExerciseInstructionsControllerTest < ActionController::TestCase
  setup do
    @exercise_instruction = exercise_instructions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exercise_instructions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exercise_instruction" do
    assert_difference('ExerciseInstruction.count') do
      post :create, exercise_instruction: { description: @exercise_instruction.description, exercise_id: @exercise_instruction.exercise_id, user_id: @exercise_instruction.user_id }
    end

    assert_redirected_to exercise_instruction_path(assigns(:exercise_instruction))
  end

  test "should show exercise_instruction" do
    get :show, id: @exercise_instruction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exercise_instruction
    assert_response :success
  end

  test "should update exercise_instruction" do
    put :update, id: @exercise_instruction, exercise_instruction: { description: @exercise_instruction.description, exercise_id: @exercise_instruction.exercise_id, user_id: @exercise_instruction.user_id }
    assert_redirected_to exercise_instruction_path(assigns(:exercise_instruction))
  end

  test "should destroy exercise_instruction" do
    assert_difference('ExerciseInstruction.count', -1) do
      delete :destroy, id: @exercise_instruction
    end

    assert_redirected_to exercise_instructions_path
  end
end
