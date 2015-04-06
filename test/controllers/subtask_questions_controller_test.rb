require 'test_helper'

class SubtaskQuestionsControllerTest < ActionController::TestCase
  setup do
    @subtask_question = subtask_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subtask_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subtask_question" do
    assert_difference('SubtaskQuestion.count') do
      post :create, subtask_question: { description: @subtask_question.description, subtask_id: @subtask_question.subtask_id }
    end

    assert_redirected_to subtask_question_path(assigns(:subtask_question))
  end

  test "should show subtask_question" do
    get :show, id: @subtask_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subtask_question
    assert_response :success
  end

  test "should update subtask_question" do
    patch :update, id: @subtask_question, subtask_question: { description: @subtask_question.description, subtask_id: @subtask_question.subtask_id }
    assert_redirected_to subtask_question_path(assigns(:subtask_question))
  end

  test "should destroy subtask_question" do
    assert_difference('SubtaskQuestion.count', -1) do
      delete :destroy, id: @subtask_question
    end

    assert_redirected_to subtask_questions_path
  end
end
