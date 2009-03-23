class Transaction < ActiveRecord::Base

  belongs_to :liquid_account
  belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"

  
  money :amount, :precision => 2, :currency => :currency
  validates_numericality_of :amount_in_cents

  validates_presence_of :receiver_id


  #1234 CLP to User


  # Wenn ein text vom Admin auf finished gesetzt wird, wird (cent_pro_wort_in_qualitätsstufe * amount_words) beim Author
  # auf das Konto (cuenta) geladen, das geld ist dann "in Umlauf", und taucht bei "En cuentas de autores auf"
  #Ein Cuenta de Liquidez zeigt immer an wieviel Bargeld grade wirklich vorhanden ist
  
  #Wenn ein Payment beantragt wird, wird die Kohle direkt vom cuenta de liquidez abgezogen, auch wenn das Geld noch nicht
  #ausbezahlt wurde
  #angezeigt wird dann in CUenta de Liquidez wieviel Geld auf dem Konto ist
  #in rot wird angeziegt was noch ausbezahlt werden muss
  

  def self.author_increase_cuenta(money, user)

    transaction do    
      user.deposit(money)
      self.create!( :liquid_account => user.distributor.liquid_account,
                    :receiver => user,
                    :amount => money,
                    :transaction_type => "author_text_finished")
    end

  end


  def self.author_order_payment(money, author)

    transaction do    
      author.withdrawal(money)
      author.distributor.liquid_account.withdrawal(money)
      author.increase_received(money)
      self.create!( :liquid_account =>author.distributor.liquid_account,
                    :receiver => author,
                    :amount => money,
                    :transaction_type => "paying_to_author")
      Payment.create!(
                    :receiver =>author, 
                    :amount => money, 
                    :distributor =>author.distributor )
    end

    

  end







end