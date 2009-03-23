class Currency < ActiveRecord::Base

  has_many :users

  def self.getformatedEarnings(real_earnings, user)
    sign = user.currency.sign.split(",")
  
    if sign[0] == "before"
      before = true
    else
      after = true
    end
  
    (before ? sign[1] : "") + real_earnings.to_s + (after ? sign[1] : "")  
  end


end