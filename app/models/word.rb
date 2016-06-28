class Word < ActiveRecord::Base
  has_many :lesson_words, dependent: :destroy
  has_many :lessons, through: :lesson_words
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers,
    reject_if: lambda {|attribute| attribute[:content].blank?}, allow_destroy: true

  QUERRY_LEARNDED = "id in (select lesson_words.word_id from
    lesson_words join lessons on lesson_words.lesson_id = lessons.id
    where lessons.user_id = ?)"

  QUERRY_NOT_LEARNDED = "id not in (select lesson_words.word_id from
    lesson_words join lessons on lesson_words.lesson_id = lessons.id
    where lessons.user_id = ?)"

  scope :by_ids, ->ids{where id: ids}
  scope :not_learned, ->user_id{where QUERRY_NOT_LEARNDED, user_id}
  scope :learned_by, ->user_id{where QUERRY_LEARNDED, user_id}
  scope :alls, ->user_id{}
  scope :by_category, ->category_id do
    where category_id: category_id if category_id.present?
  end
end
