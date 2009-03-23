class Payment < ActiveRecord::Base

  belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"
  belongs_to :distributor
    
  money :amount, :precision => 2, :currency => :currency
  validates_numericality_of :amount_in_cents
  
  
  named_scope :pending, :conditions => ['is_payed = ?', false]
  named_scope :payed, :conditions => ['is_payed = ?', true]  

  def self.pending_as_money
    Money.new(sum(:amount_in_cents, :conditions => {:is_payed => false}))
  end

  def self.payed_as_money
    Money.new(sum(:amount_in_cents, :conditions => {:is_payed => true}))
  end


  def mark_as_payed
    self.payed_at = Date.today
    self.is_payed = true

    self.distributor.liquid_account.withdrawal(self.commission)
    self.distributor.deposit(self.commission)
    self.save
  end


  def commission
    Money.new((self.amount.cents/self.distributor.commission_percentage))
  end

end
