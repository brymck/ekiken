class SessionsController < ApplicationController
  def new
  end

  def create
    if Digest::MD5.hexdigest(ENV['SALT'] + params[:password]) == ENV['ENCRYPTED_PASSWORD']
      session[:admin] = true
      redirect_to referer, notice: t(:logged_in)
    else
      redirect_to login_path, alert: t(:invalid_password)
    end
  end

  def destroy
    reset_session
    redirect_to request.env['HTTP_REFERER'], notice: t(:logged_out)
  end

  private

  def referer
    session_referer, session[:referer] = session[:referer], nil
    session_referer || request.env['HTTP_REFERER'] || 'none'
  end
end
