class SubtasksController < ApplicationController
  before_action :set_subtask, only: [:show, :edit, :update, :destroy]

  # GET /subtasks
  # GET /subtasks.json
  def index
    @subtasks = Subtask.all
  end

  # GET /subtasks/1
  # GET /subtasks/1.json
  def show
  end

  # GET /subtasks/new
  def new
    @subtask = Subtask.new
  end

  # GET /subtasks/1/edit
  def edit
  end

  # POST /subtasks
  # POST /subtasks.json
  def create
    @subtask = Subtask.new(subtask_params)

    respond_to do |format|
      if @subtask.save
        format.html { redirect_to @subtask, notice: 'Subtask was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subtask }
      else
        format.html { render action: 'new' }
        format.json { render json: @subtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subtasks/1
  # PATCH/PUT /subtasks/1.json
  def update
    respond_to do |format|
      if @subtask.update(subtask_params)
        format.html { redirect_to @subtask, notice: 'Subtask was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subtask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subtasks/1
  # DELETE /subtasks/1.json
  def destroy
    @subtask.destroy
    respond_to do |format|
      format.html { redirect_to subtasks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subtask
      @subtask = Subtask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subtask_params
      params.require(:subtask).permit(:task_id, :title, :description, :attach1, :attach2, :attach3, :attach4, :attach5)
    end
end
