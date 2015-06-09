class User < ActiveRecord::Base
  has_many :task_users
  has_many :tasks, :through => :task_users
  has_many :subtask_question_users
  has_many :subtask_questions, :through => :subtask_question_users
#  validates_uniqueness_of :email
  validates_uniqueness_of :mturk_id
  validates_presence_of :password, :on => :create


  def self.exist(mturk_id)
    user = find_by_mturk_id(mturk_id)
    if user
      user
    else
      nil
    end
  end

#  def self.authenticate(mturk_id, email, password)
#    user = find_by_email_and_mturk_id(email, mturk_id)
#    #if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
#    if user && user.password == password
#      user
#    else
#      nil
#    end
#  end


  def self.authenticate(mturk_id, password)
    user = find_by_mturk_id(mturk_id)
    #if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    if user && user.password == password
      user
    else
      nil
    end
  end


end
