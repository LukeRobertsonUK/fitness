require 'test_helper'

class PersonalBestsControllerTest < ActionController::TestCase
  setup do
    @personal_best = personal_bests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personal_bests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create personal_best" do
    assert_difference('PersonalBest.count') do
      post :create, personal_best: { exercise_id: @personal_best.exercise_id, user_id: @personal_best.user_id, weight: @personal_best.weight, weight_unit: @personal_best.weight_unit }
    end

    assert_redirected_to personal_best_path(assigns(:personal_best))
  end

  test "should show personal_best" do
    get :show, id: @personal_best
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @personal_best
    assert_response :success
  end

  test "should update personal_best" do
    put :update, id: @personal_best, personal_best: { exercise_id: @personal_best.exercise_id, user_id: @personal_best.user_id, weight: @personal_best.weight, weight_unit: @personal_best.weight_unit }
    assert_redirected_to personal_best_path(assigns(:personal_best))
  end

  test "should destroy personal_best" do
    assert_difference('PersonalBest.count', -1) do
      delete :destroy, id: @personal_best
    end

    assert_redirected_to personal_bests_path
  end
end
