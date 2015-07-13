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
      #user = User.authenticate(params[:mturk_id], params[:email], params[:password])
      user = User.authenticate(params[:mturk_id], params[:password])
      if user
        session[:user_id] = user.id
        flash[:notice] = "Welcome back!"
        if user.id == 1
          redirect_to :controller => "tasks"
        else
          redirect_to :controller => "home", :action => :welcome
        end
      else
        flash[:error] = "Invalid secret key!"
        redirect_to controller: :home, action: :login
      end
    else
      user = User.new
      user.mturk_id = params[:mturk_id]
      user.password = params[:password]
      #user.email = params[:email]
      user.presurvey_status = 0
      user.untimed_survey_status = 0 
      user.untimed_completion_survey_status = 0
      user.timed_survey_status = 0 
      user.timed_completion_survey_status = 0
	
      p user.mturk_id
      p user.password
	
      if user.save

      session[:user_id] = user.id

      initialize_user_response

      flash[:notice] = "Logged in! mturk ID: #{user.mturk_id}, Secret Key: #{user.password}"
      redirect_to :controller => "home", :action => :welcome
      else
        flash[:alert] = "Some error! We too hate this but please try again. If problem persists, contact the administrator."
        redirect_to :controller => "home", :action => :login
      end

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
    @task_user = @user.task_users.where("is_timed = 0").first
  end

  def timed_completion_survey
    @user = User.find(session[:user_id])
    @task_user = @user.task_users.where("is_timed = 1").first
  end

  def update_completion_status
    @user = User.find(session[:user_id])
    redirect_to_action = "welcome"
    
    # All workflow completion codes are of length 6. Pre survey and MturkHit are of length 8.
    # Code Format for Pre Survey: <Run#>preSta<Run# in alphabet> e.g., for the first run it will be 1preStaA
    # Code Format for workflows: <Run#><Task initial><Workflow# in word><Workflow #in alphabet> e.g., for the first run of the task 1, it will be 1wSixA
    # Code Format for MTurk Hit: <Run#><posFin><Run# in alphabet> e.g., for the first run, it will be 1posFinZ

    if params[:task] == "presurvey"
      #@user.presurvey_status = 1
      if params[:key] == "1preStaA"
        flash[:notice] = "Thank you for completing the pre-participation survey. Proceed to Workflow 1 by clicking its link under the Links section!"
        @user.update_attribute("presurvey_status", 1)
      else
        flash[:error] = "Invalid key! Complete the pre-participation survey for the key."
        redirect_to_action = "pre_survey"
        #redirect_to controller: :home, action: :pre_survey
      end
    elsif params[:task] == "untimed_survey"
      @task_user = TaskUser.find(params[:task_user_id])
      if @task_user.end_time == nil
        @task_user.end_time = Time.current
        @task_user.save
      end
      flash[:notice] = "Thank you for completing Workflow 1. Proceed to Workflow 1 Completion Survey by clicking its link under the Links section!"
      @user.update_attribute("untimed_survey_status", 1)
    elsif params[:task] == "untimed_completion_survey"
      #@user.untimed_completion_survey_status = 1
      if params[:task_id] == "1" and params[:key] == "2wSix2"
        @user.update_attribute("untimed_completion_survey_status", 1)
        flash[:notice] = "Thank you for completing Workflow 1 Completion Survey. Proceed to Workflow 2 by clicking its link under the Links section!"
      elsif  params[:task_id] == "2" and params[:key] == "2wSev2"
        @user.update_attribute("untimed_completion_survey_status", 1)
        flash[:notice] = "Thank you for completing Workflow 1 Completion Survey. Proceed to Workflow 2 by clicking its link under the Links section!"
      elsif  params[:task_id] == "3" and params[:key] == "2wEig2"
        @user.update_attribute("untimed_completion_survey_status", 1)
        flash[:notice] = "Thank you for completing Workflow 1 Completion Survey. Proceed to Workflow 2 by clicking its link under the Links section!"
      elsif  params[:task_id] == "4" and params[:key] == "2wNin2"
        @user.update_attribute("untimed_completion_survey_status", 1)
        flash[:notice] = "Thank you for completing Workflow 1 Completion Survey. Proceed to Workflow 2 by clicking its link under the Links section!"
      elsif  params[:task_id] == "5" and params[:key] == "2wTen2"
        @user.update_attribute("untimed_completion_survey_status", 1)
        flash[:notice] = "Thank you for completing Workflow 1 Completion Survey. Proceed to Workflow 2 by clicking its link under the Links section!"
      else
        flash[:error] = "Invalid key! Complete the Workflow 1 Completion Survey for the key."
        #redirect_to controller: :home, action: :untimed_completion_survey
        redirect_to_action = "untimed_completion_survey"  
      end

    elsif params[:task] == "timed_survey"
      @task_user = TaskUser.find(params[:task_user_id])
      if @task_user.end_time == nil
        @task_user.end_time = Time.current
        #@task_user.end_time = Time.now.getlocal.zone
        @task_user.save
      end
      flash[:notice] = "Thank you for completing Workflow 2. Proceed to Workflow 2 Completion Survey by clicking its link under the Links section!"
      @user.update_attribute("timed_survey_status", 1)
    elsif params[:task] == "timed_completion_survey"
      #@user.timed_completion_survey_status = 1
      if params[:task_id] == "1" and params[:key] == "2wSix2"
        @user.update_attribute("timed_completion_survey_status", 1)
        flash[:notice] = "Thank you for completing Workflow 2 Completion Survey. Please note the COMPLETION KEY highlighted below."
      elsif  params[:task_id] == "2" and params[:key] == "2wSev2"
        @user.update_attribute("timed_completion_survey_status", 1)
        flash[:notice] = "Thank you for completing Workflow 2 Completion Survey. Please note2wSev2 the COMPLETION KEY highlighted below."
      elsif  params[:task_id] == "3" and params[:key] == "2wEig2"
        @user.update_attribute("timed_completion_survey_status", 1)
        flash[:notice] = "Thank you for completing Workflow 2 Completion Survey. Please note the COMPLETION KEY highlighted below."
      elsif  params[:task_id] == "4" and params[:key] == "2wNin2"
        @user.update_attribute("timed_completion_survey_status", 1)
        flash[:notice] = "Thank you for completing Workflow 2 Completion Survey. Please note the COMPLETION KEY highlighted below."
      elsif  params[:task_id] == "5" and params[:key] == "2wTen2"
        @user.update_attribute("timed_completion_survey_status", 1)
        flash[:notice] = "Thank you for completing Workflow 2 Completion Survey. Please note the COMPLETION KEY highlighted below."
      else
        flash[:error] = "Invalid key! Complete the Workflow 2 Completion Survey for the key."
        #redirect_to controller: :home, action: :timed_completion_survey        
        redirect_to_action = "timed_completion_survey"
      end
    end
    
    #@user.save
    redirect_to controller: :home, action: redirect_to_action
  end

  def timed_survey

    #@task = Task.find(2)
    @user = User.find(session[:user_id])
    @task_user = @user.task_users.where("is_timed = 1").first
    if @task_user.start_time == nil
      @task_user.start_time = Time.current
      @task_user.save
    end
    @subtask_question_user = SubtaskQuestionUser.new

  end

  def untimed_survey

    #@task = Task.find(1)
    @user = User.find(session[:user_id])
    @task_user = @user.task_users.where("is_timed = 0").first
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
      flash[:notice] = "Answer recorded!"
      if params[:task] == "timed_survey"
        redirect_to controller: :home, action: :timed_survey
      elsif params[:task] == "untimed_survey"
        redirect_to controller: :home, action: :untimed_survey
      else
        redirect_to controller: :home, action: :welcome
      end
    else
      flash[:error] = "Error recording the answer! Please try again."
    end

  end

  def update_user_response

    @subtask_question_user = SubtaskQuestionUser.find_by_id(params[:subtask_question_user_id])
    @subtask_question_user.user_id = session[:user_id]
    @subtask_question_user.subtask_question_id = params[:subtask_question_id]
    @subtask_question_user.description = params[:description]
    if @subtask_question_user.save
      flash[:notice] = "Answer updated!"
      if params[:task] == "timed_survey"
        redirect_to controller: :home, action: :timed_survey
      elsif params[:task] == "untimed_survey"
        redirect_to controller: :home, action: :untimed_survey
      else
        redirect_to controller: :home, action: :welcome
      end
    else
      flash[:error] = "Error updating the answer! Please try again."
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
