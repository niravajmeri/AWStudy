require 'test_helper'

class SubtaskUsersControllerTest < ActionController::TestCase
  setup do
    @subtask_user = subtask_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subtask_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subtask_user" do
    assert_difference('SubtaskUser.count') do
      post :create, subtask_user: { answer1: @subtask_user.answer1, answer2: @subtask_user.answer2, answer3: @subtask_user.answer3, answer4: @subtask_user.answer4, answer5: @subtask_user.answer5, end_time: @subtask_user.end_time, start_time: @subtask_user.start_time, status: @subtask_user.status, subtask_id: @subtask_user.subtask_id, user_id: @subtask_user.user_id }
    end

    assert_redirected_to subtask_user_path(assigns(:subtask_user))
  end

  test "should show subtask_user" do
    get :show, id: @subtask_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subtask_user
    assert_response :success
  end

  test "should update subtask_user" do
    patch :update, id: @subtask_user, subtask_user: { answer1: @subtask_user.answer1, answer2: @subtask_user.answer2, answer3: @subtask_user.answer3, answer4: @subtask_user.answer4, answer5: @subtask_user.answer5, end_time: @subtask_user.end_time, start_time: @subtask_user.start_time, status: @subtask_user.status, subtask_id: @subtask_user.subtask_id, user_id: @subtask_user.user_id }
    assert_redirected_to subtask_user_path(assigns(:subtask_user))
  end

  test "should destroy subtask_user" do
    assert_difference('SubtaskUser.count', -1) do
      delete :destroy, id: @subtask_user
    end

    assert_redirected_to subtask_users_path
  end
end
