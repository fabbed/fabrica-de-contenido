class UserMailer < ActionMailer::Base

  def distributor_signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
    @body[:url]  = "localhost/activate/#{user.activation_code}"
  end

  def author_signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
    @body[:url]  = "localhost/activate/#{user.activation_code}"
  end


  def new_suggestion_arrived(user, name_of_suggester)
    setup_email(user)
    @subject    += 'Nueva surgerencia de: ' + name_of_suggester
  end



  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://YOURSITE/"
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "conoceos.com <admin@conoceos.com>"
      @subject     = ""
      @reply_to     = "admin@conoceos.com"
      @sent_on     = Time.now
      @body[:user] = user
    end
end
