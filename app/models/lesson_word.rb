class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer
  scope :is_corrects, -> do
    joins(:answer).where answers:{is_correct: true}
  end
end
