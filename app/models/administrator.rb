class Administrator < User
  has_many :projects
  
  has_one :liquid_account, :class_name => "LiquidAccount", :foreign_key => "owner_id"
  
end
