class Distributor < User
  has_many :authors, :foreign_key => "distributor_id"
  has_one :liquid_account, :class_name => "LiquidAccount", :foreign_key => "distributor_id"
  has_many :payments

  money :cuenta, :precision => 2, :currency => :cuenta_currency
  validates_numericality_of :cuenta_in_cents



#  join authors mit distribudor jobs mit authors where status_id = 4
#  SELECT `jobs`.* FROM `jobs` INNER JOIN `users` ON `users`.id = `jobs`.author_id WHERE (`jobs`.`status_id` = 4 AND `users`.`distributor_id` = 3)
  def jobs_to_review
    jobs = Job.find(:all,  :joins => [:user], 
                    :conditions =>["users.distributor_id = ? and (jobs.status_id = ? or jobs.status_id = ?)",
                      self.id, Status.find_by_label("review").id, Status.find_by_label("improved").id] )
  end

  def jobs_in_process
    jobs = Job.find(:all,  :joins => [:user], 
                    :conditions =>["users.distributor_id = ? and (jobs.status_id = ? or jobs.status_id = ?)",
                      self.id, Status.find_by_label("taken").id, Status.find_by_label("improve").id] )
  end

  def jobs_finished
    jobs = Job.find(:all,  :joins => [:user], 
                    :conditions =>["users.distributor_id = ? and (jobs.status_id = ? or jobs.status_id = ?)",
                      self.id, Status.find_by_label("ready").id, Status.find_by_label("payed").id] )
  end




end
