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
    user = User.exist(params[:mturk_id])

    if user
      user = User.authenticate(params[:mturk_id], params[:email], params[:password])
      if user
        session[:user_id] = user.id
        #:notice => "Logged in!"
        redirect_to :controller => "home", :action => "welcome"
      else
        flash.now.alert = "Invalid mturk ID or email or password!"
        redirect_to controller: :home, action: :login
      end
    else
      user = User.new
      user.mturk_id = params[:mturk_id]
      user.password = params[:password]
      user.email = params[:email]
      user.presurvey_status = 0
      user.untimed_survey_status = 0 
      user.untimed_completion_survey_status = 0
      user.timed_survey_status = 0 
      user.timed_completion_survey_status = 0
      user.save

      session[:user_id] = user.id

      initialize_user_response

        #:notice => "Logged in!"
      redirect_to :controller => "home", :action => "welcome"

    end

  end

  def welcome
    @user = User.find(session[:user_id])
  end

  def pre_survey
    @user = User.find(session[:user_id])
  end

  def untimed_completion_survey
    @user = User.find(session[:user_id])
  end

  def timed_completion_survey
    @user = User.find(session[:user_id])
  end

  def update_completion_status
    @user = User.find(session[:user_id])

    if(params[:task} == "presurvey" and params[:key] == "key")
      @user.presurvey_status = 1
    elsif(params[:task] == "untimed_survey")
      @user.untimed_survey_status = 1
    elsif(params[:task] == "untimed_completion_survey" and params[:key] == "untimedkey")
      @user.untimed_completion_survey_status = 1
    elsif(params[:task] == "timed_survey")
      @user.timed_survey_status = 1
    elsif(params[:task] == "timed_completion_survey" and params[:key] == "timedkey")
      @user.timed_completion_survey_status = 1
    end
    @user.save

    redirect_to :controller => "home", :action => "welcome"

  end

  def timed_survey

    #@task = Task.find(2)
    @user = User.find(session[:user_id])
    @task_user = @user.task_users.where("is_timed == 1").first
    if @task_user.start_time == nil
      @task_user.start_time = Time.current
      @task_user.save
    end
    @subtask_question_user = SubtaskQuestionUser.new

  end

  def untimed_survey

    #@task = Task.find(1)
    @user = User.find(session[:user_id])
    @task_user = @user.task_users.where("is_timed == 0").first
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
      @untimed_task_id = 1
      @timed_task_id = 2
    elsif  session[:user_id].to_i % 10 == 2
      @untimed_task_id = 2
      @timed_task_id = 1
    elsif  session[:user_id].to_i % 10 == 3
      @untimed_task_id = 2
      @timed_task_id = 3
    elsif  session[:user_id].to_i % 10 == 4
      @untimed_task_id = 3
      @timed_task_id = 2
    elsif  session[:user_id].to_i % 10 == 5
      @untimed_task_id = 3
      @timed_task_id = 4
    elsif  session[:user_id].to_i % 10 == 6
      @untimed_task_id = 4
      @timed_task_id = 3
    elsif  session[:user_id].to_i % 10 == 7
      @untimed_task_id = 4
      @timed_task_id = 5
    elsif  session[:user_id].to_i % 10 == 8
      @untimed_task_id = 5
      @timed_task_id = 4
    elsif  session[:user_id].to_i % 10 == 9
      @untimed_task_id = 5
      @timed_task_id = 1
    elsif  session[:user_id].to_i % 10 == 0
      @untimed_task_id = 1
      @timed_task_id = 5
    end

    user_untimed_task = TaskUser.new
    user_untimed_task.task_id = @untimed_task_id
    user_untimed_task.user_id = session[:user_id]
    user_untimed_task.status = 0
    user_untimed_task.is_timed = 0
    user_untimed_task.save

    user_timed_task = TaskUser.new
    user_timed_task.task_id = @timed_task_id
    user_timed_task.user_id = session[:user_id]
    user_timed_task.status = 0
    user_timed_task.is_timed = 1
    user_timed_task.save


  end

end
