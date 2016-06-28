class Lesson < ActiveRecord::Base
  include CreateActivity

  belongs_to :user
  belongs_to :category
  has_many :lesson_words, dependent: :destroy
  has_many :words, through: :lesson_words
  has_many :answers, through: :lesson_words

  accepts_nested_attributes_for :lesson_words,
    reject_if: lambda {|attribute| attribute[:word_id].blank?}, allow_destroy: true

  before_create :random_words
  before_update :change_status
  after_update :create_learned_activities
  after_create :create_learning_activities

  private
  def random_words
    self.words = if category.words.size >= Settings.lesson_word_size
      category.words.limit Settings.lesson_word_size
    else
      category.words
    end
  end

  def change_status
    self.status = self.status.nil?
  end

  def create_learned_activities
    create_activity self.user_id, self.id, Settings.activity.learned
  end

  def create_learning_activities
    create_activity self.user_id, self.id, Settings.activity.learning
  end
end
