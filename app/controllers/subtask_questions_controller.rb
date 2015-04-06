class SubtaskQuestionsController < ApplicationController
  before_action :set_subtask_question, only: [:show, :edit, :update, :destroy]

  # GET /subtask_questions
  # GET /subtask_questions.json
  def index
    @subtask_questions = SubtaskQuestion.all
  end

  # GET /subtask_questions/1
  # GET /subtask_questions/1.json
  def show
  end

  # GET /subtask_questions/new
  def new
    @subtask_question = SubtaskQuestion.new
  end

  # GET /subtask_questions/1/edit
  def edit
  end

  # POST /subtask_questions
  # POST /subtask_questions.json
  def create
    @subtask_question = SubtaskQuestion.new(subtask_question_params)

    respond_to do |format|
      if @subtask_question.save
        format.html { redirect_to @subtask_question, notice: 'Subtask question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subtask_question }
      else
        format.html { render action: 'new' }
        format.json { render json: @subtask_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subtask_questions/1
  # PATCH/PUT /subtask_questions/1.json
  def update
    respond_to do |format|
      if @subtask_question.update(subtask_question_params)
        format.html { redirect_to @subtask_question, notice: 'Subtask question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subtask_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subtask_questions/1
  # DELETE /subtask_questions/1.json
  def destroy
    @subtask_question.destroy
    respond_to do |format|
      format.html { redirect_to subtask_questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subtask_question
      @subtask_question = SubtaskQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subtask_question_params
      params.require(:subtask_question).permit(:subtask_id, :description)
    end
end
