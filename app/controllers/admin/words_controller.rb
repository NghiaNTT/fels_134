class Admin::WordsController < ApplicationController
  before_action :logged_in_user, :verify_admin_user
  before_action :find_word, except: [:new, :index]

   def show
   end

   def index
   end

  def destroy
    @word.destroy
    flash[:success] = t "flash_message.delete_success"
    redirect_to admin_category_words_url
  end

  private
  def find_word
    @word = Word.find_by id: params[:id]
  end
end
