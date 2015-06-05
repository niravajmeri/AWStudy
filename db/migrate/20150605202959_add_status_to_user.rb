class AddStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :presurvey_status, :boolean
    add_column :users, :timed_survey_status, :boolean
    add_column :users, :timed_completion_survey_status, :boolean
    add_column :users, :untimed_survey_status, :boolean
    add_column :users, :untimed_completion_survey_status, :boolean
  end
end
