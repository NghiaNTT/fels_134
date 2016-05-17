class CategoriesController < ApplicationController
  def new
  end

  def index
    @categories = Category.paginate page: params[:page]
  end
end
