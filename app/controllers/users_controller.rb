class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show

    @untimed_task_user = @user.task_users.where("is_timed = 0").first
    @timed_task_user = @user.task_users.where("is_timed = 1").first

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    p "presurvey_status"
    p params[:user][:presurvey_status]
    respond_to do |format|
      if @user.update(user_params)
        @user.update_attribute(:presurvey_status, params[:user][:presurvey_status])
        @user.update_attribute(:untimed_survey_status, params[:user][:untimed_survey_status])
        @user.update_attribute(:untimed_completion_survey_status, params[:user][:untimed_completion_survey_status])
        @user.update_attribute(:timed_survey_status, params[:user][:timed_survey_status])
        @user.update_attribute(:timed_completion_survey_status, params[:user][:timed_completion_survey_status])

        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:mturk_id, :password, :email)
    end
end
