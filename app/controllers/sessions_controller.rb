class SessionsController < ApplicationController
  
  def home

  end

  def new
    @user = User.new
  end

  def create #sign_in
    user = User.find_by_name(params[:user][:name]).try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to signin_path
      flash.alert = "Login and password combo do not match."
    end
  end

  def destroy #sign_out
    session.clear
    redirect_to root_path
  end
end
