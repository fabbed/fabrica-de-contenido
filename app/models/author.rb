class Author < User
  
  belongs_to :distributor
  has_many :transactions, :foreign_key => "receiver_id"
  has_many :payments,     :foreign_key => "receiver_id"

  money :cuenta, :precision => 2, :currency => :cuenta_currency
  validates_numericality_of :cuenta_in_cents
  money :received, :precision => 2, :currency => :cuenta_currency
  validates_numericality_of :received_in_cents



  validates_presence_of   :gender
  validates_presence_of   :name
  validates_length_of     :name,              :within => 1..100
  validates_presence_of   :surname
  validates_length_of     :surname,               :within => 1..100
  #validates_existence_of  :country, :allow_nil => true
  validates_presence_of :country_id
  validates_presence_of   :city
  validates_length_of     :city,               :within => 1..100
  validates_presence_of   :address1
  validates_length_of     :address1,           :within => 1..100
  validates_presence_of   :birth_date
  validates_presence_of   :distributor_id
    
  validates_date          :birth_date,              :on_or_before => Proc.new { 18.years.ago }

  validate_on_create      :check_distributor_code

  after_create :process_distributor
  attr_accessor   :distributor_code

  symbolize :gender


  #################### NAMES_SCOPES #################

  # named_scope :activated,       { :conditions => ["activation_code = ''"] }
  # named_scope :active,       { :conditions => ["activation_code = ''"] }



  

  #################### METHODS #################




  def pending_payments_as_money
    Money.new(self.payments.pending.inject(0) {|sum, payment| sum +=payment.amount_in_cents})
  end


  def check_distributor_code
    if self.distributor_code.blank?
      self.errors.add(:distributor_code, "Para registrar es necesario tener un código de un distribudor")
      return false
    end

    if !DistributorCode.exists?(self.distributor_code)
      self.errors.add(:distributor_code, "Este codigo no existe.")
    end
  end

  def process_distributor
    if !self.distributor_code.blank?
      distributor_code = DistributorCode.find_by_code(self.distributor_code)
      self.distributor_id = distributor_code.user_id
      self.save!
            
      distributor_code.used_again!
    end
  end
  



  
end
