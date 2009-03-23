class Account::BaseController < ApplicationController
  before_filter :login_required
  
  
  def user_home
    "/admin/home"
  end
  
  
  protected
  
  def find_user
    @user = User.find(current_user.id)
  end
end
