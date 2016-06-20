class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user, :verify_admin_user, only: [:index, :destroy, :index]

  def index
    @categories = Category.paginate page: params[:page]
  end

  def show
    @category = Category.find params[:id]
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = t "flash_message.delete_success"
    redirect_to admin_categories_url
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = t"edit_category.edit_success"
      redirect_to @category
    else
      render :edit
    end
  end

end
