class SubtaskUsersController < ApplicationController
  before_action :set_subtask_user, only: [:show, :edit, :update, :destroy]

  # GET /subtask_users
  # GET /subtask_users.json
  def index
    @subtask_users = SubtaskUser.all
  end

  # GET /subtask_users/1
  # GET /subtask_users/1.json
  def show
  end

  # GET /subtask_users/new
  def new
    @subtask_user = SubtaskUser.new
  end

  # GET /subtask_users/1/edit
  def edit
  end

  # POST /subtask_users
  # POST /subtask_users.json
  def create
    @subtask_user = SubtaskUser.new(subtask_user_params)

    respond_to do |format|
      if @subtask_user.save
        format.html { redirect_to @subtask_user, notice: 'Subtask user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subtask_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @subtask_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subtask_users/1
  # PATCH/PUT /subtask_users/1.json
  def update
    respond_to do |format|
      if @subtask_user.update(subtask_user_params)
        format.html { redirect_to @subtask_user, notice: 'Subtask user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subtask_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subtask_users/1
  # DELETE /subtask_users/1.json
  def destroy
    @subtask_user.destroy
    respond_to do |format|
      format.html { redirect_to subtask_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subtask_user
      @subtask_user = SubtaskUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subtask_user_params
      params.require(:subtask_user).permit(:subtask_id, :user_id, :status, :start_time, :end_time, :answer1, :answer2, :answer3, :answer4, :answer5)
    end
end
