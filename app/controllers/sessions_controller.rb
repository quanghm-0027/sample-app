class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: session_email

    if user&.authenticate params[:session][:password]
      if user.activated?
        log_in user
        session_remember user
        redirect_back_or user
      else
        flash[:warning] = message
        redirect_to root_url
      end
    else
      message
      flash.now[:danger] = t("invalid")
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  def session_email
    params[:session][:email].downcase
  end

  def session_remember user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
  end

  def message
    t("not_activated")
  end
end
