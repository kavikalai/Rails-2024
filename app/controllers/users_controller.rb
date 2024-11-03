class UsersController < ApplicationController
  layout 'dashboard'
  before_action :login_required

  def index
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    user = User.find_by_id(params[:id])
    #user.update(permited_params)
    flash[:message] = "Updated"
    redirect_to profile_user_path(user.id)
  end

  private

  def permited_params
    params.require(:user).permit(:first_name, :last_name, :email, :mobile_number, :avatar)
  end
end
