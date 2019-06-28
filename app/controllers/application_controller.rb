# comment

class ApplicationController < ActionController::Base
  before_action :set_locale
  private
  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ?
                      locale : I18n.default_locale
  end
end
