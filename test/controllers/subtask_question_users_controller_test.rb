require 'test_helper'

class SubtaskQuestionUsersControllerTest < ActionController::TestCase
  setup do
    @subtask_question_user = subtask_question_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subtask_question_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subtask_question_user" do
    assert_difference('SubtaskQuestionUser.count') do
      post :create, subtask_question_user: { description: @subtask_question_user.description, subtask_question_id: @subtask_question_user.subtask_question_id, user_id: @subtask_question_user.user_id }
    end

    assert_redirected_to subtask_question_user_path(assigns(:subtask_question_user))
  end

  test "should show subtask_question_user" do
    get :show, id: @subtask_question_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subtask_question_user
    assert_response :success
  end

  test "should update subtask_question_user" do
    patch :update, id: @subtask_question_user, subtask_question_user: { description: @subtask_question_user.description, subtask_question_id: @subtask_question_user.subtask_question_id, user_id: @subtask_question_user.user_id }
    assert_redirected_to subtask_question_user_path(assigns(:subtask_question_user))
  end

  test "should destroy subtask_question_user" do
    assert_difference('SubtaskQuestionUser.count', -1) do
      delete :destroy, id: @subtask_question_user
    end

    assert_redirected_to subtask_question_users_path
  end
end
