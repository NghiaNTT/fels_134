class Admin::WordsController < ApplicationController
  before_action :logged_in_user, :verify_admin_user
  before_action :load_category
  before_action :find_word, except: [:index, :new, :create]

  def show
    @ansers = @word.answers
  end

  def new
    @word = Word.new
  end

  def create
    @word = @category.words.new word_params
    if @word.save
      flash[:success] = t "words.flash_create_success"
      redirect_to admin_category_path @category
    else
      flash[:danger] = t "words.flash_create_unsuccess"
      render :new
    end
  end

  def edit
  end

  def update
    if @word.update_attributes word_params
      flash[:success] = t "words.flash_update_success"
      redirect_to :back
    else
      flash[:danger] = t "words.flash_update_fail"
      render :edit
    end
  end

  def destroy
    @word.destroy
    flash[:success] = t "flash_message.delete_success"
    redirect_to :back
  end

  private
  def word_params
    params.require(:word).permit :name, :category_id,
      answers_attributes: [:id, :content, :is_correct, :_destroy]
  end

  def load_category
    @category = Category.find_by id: params[:category_id]
  end

  def find_word
    @word = Word.find_by id: params[:id]
  end
end
