require 'digest/sha1'
class User < ActiveRecord::Base
  belongs_to :country
    
  has_many :jobs, :foreign_key => "author_id"

  # Virtual attribute for the unencrypted password
  attr_accessor :password

  # validates_presence_of     :login, :email
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  # validates_length_of       :login,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false
  before_save :encrypt_password
  before_create :make_activation_code 

  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  validates_presence_of     :country_id
  attr_accessible :login, :email, :password, :password_confirmation, :gender, :country_id, :name, :surname, :city, :address1, :birth_date, :distributor_code, :avatar, :distributor_id

  has_attached_file :avatar, :styles => { :medium => "200x250>", :small => "40x40>", :thumb => "25x25>" }

  named_scope :activated,       { :conditions => ["activation_code IS NULL"] }
  named_scope :active,       { :conditions => ["activated_at IS NOT NULL"] }



  def payoutPossible?(money)
    (money >= Money.new(PAYOUT_AT)) and (self.cuenta >= money)
  end



  # Money related
  def deposit(money)
    self.cuenta += money
    self.save
  end

  def withdrawal(money)
    if self.payoutPossible?(money) or true
      self.cuenta -= money
      self.save
    else
      raise
    end
  end


  def increase_received(money)
    self.received += money
    self.save
  end

  def fullname
    name + " " + surname
  end

  def has_any_text_activity?
    return true if self.jobs.in_progress.present? or self.jobs.to_review.present? or self.jobs.finished.present?
    return false
  end

  def has_photo?
    return true if self.avatar
  end

  def spanish_gender
    gender == "male" ? "Hombre" : "Mujer"    
  end

  def age
    now = Time.now.utc
    now.year - birth_date.year - (birth_date.to_time.change(:year => now.year) > now ? 1 : 0)
  end    

  def is_author?
    return true if self.class.name == "Author"
    return false
  end

  def is_distributor?
    return true if self.class.name == "Distributor"
    return false
  end

  def is_admin?
    return true if self.class.name == "Administrator"
    return false
  end



  # Activates the user in the database.
  def activate
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  def active?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(email, password)
    u = find :first, :conditions => ['email = ? and activated_at IS NOT NULL', email] # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
      
    def password_required?
      crypted_password.blank? || !password.blank?
    end
    
    def make_activation_code

      self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    end
    
end
