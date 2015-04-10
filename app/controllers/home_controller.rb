class HomeController < ApplicationController

  def login
    @user = User.new
  end

  def signin
    user = User.authenticate(params[:mturk_id], params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to :controller => "home", :action => "survey", :notice => "Logged in!"
    else
      flash.now.alert = "Invalid mturk ID or email or password!"
    end
  end

  def survey
    @task = Task.find(1)
    @user = User.find(1)
    @task_user = @user.tasks.first
    @subtask_question_user = SubtaskQuestionUser.new
  end

  def record_userresponse
  end

end
