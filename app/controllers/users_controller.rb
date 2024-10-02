class UsersController < ApplicationController
  layout 'dashboard'
  before_action :login_required

  def index
    
  end

  

  def show
    @current_user
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

end
