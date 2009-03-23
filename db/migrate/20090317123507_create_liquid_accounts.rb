class CreateLiquidAccounts < ActiveRecord::Migration
  def self.up
    create_table :liquid_accounts do |t|

      t.belongs_to :distributor
      t.belongs_to :owner      
      
      t.integer :balance_in_cents
      t.string  :account_currency

      t.timestamps
    end
    
    LiquidAccount.create!(:distributor_id => Distributor.find_by_login("julian").id,
                          :owner_id => Administrator.find_by_login("fabian").id,
                          :balance_in_cents => 37728065,
                          :account_currency => "CLP")

    LiquidAccount.create!(:distributor_id => Distributor.find_by_login("peter").id,
                          :owner_id => Administrator.find_by_login("fabian").id,
                          :balance_in_cents => 20000000,
                          :account_currency => "CLP")
    
  end

  def self.down
    drop_table :liquid_accounts
  end
end
