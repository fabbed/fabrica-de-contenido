class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    
    respond_to do |wants|
      wants.html
      wants.js { render :partial => "show_ajax" }
    end
  end


  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/')
  end

end
