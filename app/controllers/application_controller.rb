class ApplicationController < ActionController::Base
  
  def login_required
    if session[:user_id]
      @current_user = User.find_by_id(session[:user_id])
    else
      redirect_to root_path
    end
  end

end
