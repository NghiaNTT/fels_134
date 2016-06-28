class Activity < ActiveRecord::Base
  belongs_to :user
  enum action_type: {learned: 1, learning: 2, follow: 3, unfollow: 3}

  def load_lesson
    Lesson.find_by id: self.targer_id
  end

  def load_user
    User.find_by id: self.targer_id
  end
end
