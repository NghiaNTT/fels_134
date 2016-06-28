class LessonsController < ApplicationController
  before_action :logged_in_user
  before_action :find_lesson, only: [:show]

  def show
    if @lesson.status.present?
      ids = @lesson.lesson_words.map &:answer_id
      @answers = Answer.eager_load_by_ids(ids)
    end
  end

  def new

  end

  def create
    @lesson = current_user.lessons.build lesson_params
    if @lesson.save
      flash[:success] = t "lessons.create_success"
      redirect_to @lesson
    else
      flash[:danger] = t "lessons.create_unsuccess"
      redirect_to @category
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit :user_id, :category_id,
      lesson_words_attributes: [:id, :word_id, :answer_id, :_destroy ]
  end

  def find_lesson
    @lesson = Lesson.find_by id: params[:id]
  end
end
