class PagesController < ApplicationController
  def home
  end

  def about
  end
  
  def root
    redirect_to home_path(preferred_locale)
  end

  private

  def preferred_locale
    request.accept_language.split(",").each do |language|
      return language if I18n.available_locales.include?(language.to_sym)
    end

    I18n.default_locale.to_s
  end
end
