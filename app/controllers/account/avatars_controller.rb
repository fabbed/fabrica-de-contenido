class Account::AvatarsController < Account::BaseController
  before_filter :find_user
  
  def show
  end
  
  def update
    # puts send(":"+current_user.class.name
    if @user.update_attributes(params[:user])
      flash[:notice] = "Foto subido"
      redirect_to user_home
    else
      render :action => "show"
    end
  end

  def create
    if @user.update_attributes(params[:user])
      flash[:notice] = I18n.t('txt.users.msg_update_avatar_success')
      redirect_to user_home
    else
      render :action => "show"
    end
  end


end