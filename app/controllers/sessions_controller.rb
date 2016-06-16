class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def switch
    session[:locale] = params[:locale]
    redirect_to_back_or_root
  end

  private

  def redirect_to_back_or_root(default = root_path)
    if request.env["HTTP_REFERER"].present? && request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to root_url
    end
  end

end
