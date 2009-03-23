class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|

      t.belongs_to :receiver
      t.belongs_to :liquid_account
      t.integer :amount_in_cents
      t.string :currency
      t.string :transaction_type

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
