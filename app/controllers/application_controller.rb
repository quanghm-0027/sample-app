# comment

class ApplicationController < ActionController::Base
  before_action :set_locale

  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    compare_variable = I18n.available_locales.include?(locale)
    I18n.locale = compare_variable ? locale : I18n.default_locale
  end

  def default_url_options
    {locale:I18n.locale}
  end

  private

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "login_pls"
    redirect_to login_url
  end
end
