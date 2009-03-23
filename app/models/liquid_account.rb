class LiquidAccount < ActiveRecord::Base

  belongs_to :distributor
  belongs_to :owner, :class_name => "Administrator", :foreign_key => "owner_id"
  
  money :balance, :precision => 2, :currency => :account_currency
  validates_numericality_of :balance_in_cents


  # Money related
  def deposit(money)
    self.balance += money
    self.save
  end

  def withdrawal(money)
    self.balance -= money
    self.save
  end
  

end
