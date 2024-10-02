class SessionsController < ApplicationController

  def create
    @user = User.find_by_username(params[:user][:username])
    if !!@user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      message = 'invalid_creditails'
      redirect_to root_path, flash: { success: 'Registration successfully' }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end