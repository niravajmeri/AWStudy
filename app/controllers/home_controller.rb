class HomeController < ApplicationController

  def login
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
      redirect_to :controller => "home", :action => "survey"
    else
      flash.now.alert = "Invalid mturk ID or email or password!"
      redirect_to controller: :home, action: :login
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
