class AuthorsController < ApplicationController

  # render new.rhtml
  def new
    @author = Author.new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @author = Author.new(params[:author])
    @author.save
    if @author.errors.empty?
      self.current_user = @author
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end


end
