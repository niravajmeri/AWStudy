class SubtaskQuestionUsersController < ApplicationController
  before_action :set_subtask_question_user, only: [:show, :edit, :update, :destroy]

  # GET /subtask_question_users
  # GET /subtask_question_users.json
  def index
    @subtask_question_users = SubtaskQuestionUser.all
  end

  # GET /subtask_question_users/1
  # GET /subtask_question_users/1.json
  def show
  end

  # GET /subtask_question_users/new
  def new
    @subtask_question_user = SubtaskQuestionUser.new
  end

  # GET /subtask_question_users/1/edit
  def edit
  end

  # POST /subtask_question_users
  # POST /subtask_question_users.json
  def create
    @subtask_question_user = SubtaskQuestionUser.new(subtask_question_user_params)

    respond_to do |format|
      if @subtask_question_user.save
        format.html { redirect_to @subtask_question_user, notice: 'Subtask question user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subtask_question_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @subtask_question_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subtask_question_users/1
  # PATCH/PUT /subtask_question_users/1.json
  def update
    respond_to do |format|
      if @subtask_question_user.update(subtask_question_user_params)
        format.html { redirect_to @subtask_question_user, notice: 'Subtask question user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subtask_question_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subtask_question_users/1
  # DELETE /subtask_question_users/1.json
  def destroy
    @subtask_question_user.destroy
    respond_to do |format|
      format.html { redirect_to subtask_question_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subtask_question_user
      @subtask_question_user = SubtaskQuestionUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subtask_question_user_params
      params.require(:subtask_question_user).permit(:subtask_question_id, :user_id, :description)
    end
end
