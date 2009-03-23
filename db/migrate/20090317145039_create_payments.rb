class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|

      t.belongs_to :receiver
      t.belongs_to :distributor
            
      t.integer :amount_in_cents
      t.string :currency

      t.boolean :is_payed, :default => false

      t.date :payed_at
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
