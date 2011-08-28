class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  helper_method :admin?

  private

  def admin?
    !!session[:admin]
  end

  def authorize
    unless admin?
      session[:referer] = request.fullpath
      redirect_to login_path, alert: t(:please_log_in)
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { :locale => I18n.locale }
  end

  def english?
    I18n.locale == :en
  end

  def japanese?
    I18n.locale == :ja
  end
end
