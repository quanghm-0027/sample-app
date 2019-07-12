class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: downcase_email

    if user&.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = t("invalid")
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  def downcase_email
    params[:session][:email].downcase
  end
end
