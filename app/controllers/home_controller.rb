class HomeController < ApplicationController

  def login
    session[:user_id] = nil
    @user = User.new
  end

  def logout
    session[:user_id] = nil
    redirect_to controller: :home, action: :login
  end

  def signin
    user = User.authenticate(params[:mturk_id], params[:email], params[:password])
    if user
      session[:user_id] = user.id
      #:notice => "Logged in!"
      redirect_to :controller => "home", :action => "welcome"
    else
      flash.now.alert = "Invalid mturk ID or email or password!"
      redirect_to controller: :home, action: :login
    end
  end

  def welcome
    @user = User.find(session[:user_id])
  end

  def pre_survey
    @user = User.find(session[:user_id])
  end

  def workflow_completion_survey
    @user = User.find(session[:user_id])
  end

  def timed_survey

    @task = Task.find(2)
    @user = User.find(session[:user_id])
    @task_user = @user.task_users.first
    if @task_user.start_time == nil
      @task_user.start_time = Time.current
      @task_user.save
    end
    @subtask_question_user = SubtaskQuestionUser.new

  end

  def untimed_survey

    @task = Task.find(1)
    @user = User.find(session[:user_id])
    @task_user = @user.task_users.first
    if @task_user.start_time == nil
      @task_user.start_time = Time.current
      @task_user.save
    end
    @subtask_question_user = SubtaskQuestionUser.new

  end

  def survey

    #initialize_user_response
    @task = Task.find(1)
    @user = User.find(1)
    @task_user = @user.tasks.first
    @subtask_question_user = SubtaskQuestionUser.new
  end

  def record_user_response

    @subtask_question_user = SubtaskQuestionUser.new
    @subtask_question_user.user_id = session[:user_id]
    @subtask_question_user.subtask_question_id = params[:subtask_question_id]
    @subtask_question_user.description = params[:description]
    if @subtask_question_user.save
      redirect_to controller: :home, action: :timed_survey
    end

  end

  def update_user_response
    @subtask_question_user = SubtaskQuestionUser.find_by_id(params[:subtask_question_user_id])
    @subtask_question_user.user_id = session[:user_id]
    @subtask_question_user.subtask_question_id = params[:subtask_question_id]
    @subtask_question_user.description = params[:description]
    if @subtask_question_user.save
      redirect_to controller: :home, action: :timed_survey
    end

  end


  def initialize_user_response
    #1 - T1u T2t
    #2 - T1t T2u
    #3 - T2u T3t
    #4 - T2t T3u
    #5 - T3u T4t
    #6 - T3t T4u
    #7 - T4u T5t
    #8 - T4t T5u
    #9 - T5u T1t
    #10 - T5t T1u
    
    if session[:user_id].to_i % 10 == 1
      @task1 = Task.find(1)
      @task2 = Task.find(2)
    elsif  session[:user_id].to_i % 10 == 2
      @task1 = Task.find(2)
      @task2 = Task.find(1)
    elsif  session[:user_id].to_i % 10 == 3
      @task1 = Task.find(2)
      @task2 = Task.find(3)
    elsif  session[:user_id].to_i % 10 == 4
      @task1 = Task.find(3)
      @task2 = Task.find(2)
    elsif  session[:user_id].to_i % 10 == 5
      @task1 = Task.find(3)
      @task2 = Task.find(4)
    elsif  session[:user_id].to_i % 10 == 6
      @task1 = Task.find(4)
      @task2 = Task.find(3)
    elsif  session[:user_id].to_i % 10 == 7
      @task1 = Task.find(4)
      @task2 = Task.find(5)
    elsif  session[:user_id].to_i % 10 == 8
      @task1 = Task.find(5)
      @task2 = Task.find(4)
    elsif  session[:user_id].to_i % 10 == 9
      @task1 = Task.find(5)
      @task2 = Task.find(1)
    elsif  session[:user_id].to_i % 10 == 0
      @task1 = Task.find(1)
      @task2 = Task.find(5)
    end

  end

end
