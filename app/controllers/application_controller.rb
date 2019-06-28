# comment

class ApplicationController < ActionController::Base
  before_action :set_locale
  private
  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    compare_variable = I18n.available_locales.include?(locale)
    I18n.locale = compare_variable ? locale : I18n.default_locale
  end
end
