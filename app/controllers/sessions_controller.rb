# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  # render new.rhtml
  def new
    render :partial => "new"
  end

  def create
    self.current_user = User.authenticate(params[:email], params[:password])
    if logged_in?

      # if params[:remember_me] == "1"
      if true      
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      
      if current_user.class.name == "Author"
        redirect_back_or_default('/account/home_author')
      elsif current_user.class.name == "Distributor"
        redirect_back_or_default('/account/home_distributor')
      elsif current_user.class.name == "Administrator"
        redirect_back_or_default('/admin/home')
      end
      flash[:notice] = "Logged in successfully"
    else
      render :action => 'new'
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
