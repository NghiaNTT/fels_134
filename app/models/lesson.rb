class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :lesson_words, dependent: :destroy
  has_many :words, through: :lesson_words

  accepts_nested_attributes_for :lesson_words,
    reject_if: lambda {|attribute| attribute[:word_id].blank?}, allow_destroy: true

  before_create :random_words

  private
    def random_words
    self.words = if category.words.size >= lesson_word_size
      category.words.limit lesson_word_size
    else
      category.words
    end
  end
end
