class UserObserver < ActiveRecord::Observer
  def after_create(user)
    
    # case user.class.name
    #   when "Distributor"
    #     UserMailer.deliver_distributor_signup_notification(user)
    #   when "Author"
    #     UserMailer.deliver_author_signup_notification(user)
    #   when "Client"            
    # end
        

  end

  def after_save(user)
  
    # UserMailer.deliver_activation(user) if user.recently_activated?
  
  end
end
