require 'test_helper'

class TaskUsersControllerTest < ActionController::TestCase
  setup do
    @task_user = task_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_user" do
    assert_difference('TaskUser.count') do
      post :create, task_user: { status: @task_user.status, task_id: @task_user.task_id, user_id: @task_user.user_id }
    end

    assert_redirected_to task_user_path(assigns(:task_user))
  end

  test "should show task_user" do
    get :show, id: @task_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_user
    assert_response :success
  end

  test "should update task_user" do
    patch :update, id: @task_user, task_user: { status: @task_user.status, task_id: @task_user.task_id, user_id: @task_user.user_id }
    assert_redirected_to task_user_path(assigns(:task_user))
  end

  test "should destroy task_user" do
    assert_difference('TaskUser.count', -1) do
      delete :destroy, id: @task_user
    end

    assert_redirected_to task_users_path
  end
end
