class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :verify_logged_in_user, only: [:edit, :update]
  before_action :find_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def index
    @users = User.paginate page: params[:page]
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "signup_pages.flash_messg"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @words = Word.learned(@user.id)
    @activities = @user.activities.order(created_at: :desc).paginate page: params[:page]
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "edit_users.profile_update"
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless current_user? @user
  end

  def find_user
    @user = User.find params[:id]
  end
end
