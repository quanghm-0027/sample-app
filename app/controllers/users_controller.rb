class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :find_user, only: %i(show edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def index
    @users = User.page(params[:page]).per Settings.per_page
  end

  def show; end

  def new
    @user = User.new
    redirect_to root_path if logged_in?
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "welcome"
      redirect_to @user
      @user.send_activation_email
      flash[:info] = t "pls_check"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user_deleted"
    else
      flash[:danger] = t "cannot_delete"
    end
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation
  end

  def find_user
    @user = User.find_by id: params[:id]

    return @user if @user
    flash[:warning] = t "not_found_user"
    redirect_to root_path
  end

  def correct_user
    redirect_to root_path unless current_user?(@user)
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "login_please"
    redirect_to login_url
  end

  def admin_user
    redirect_to root_path unless correct_user.admin?
  end
end
