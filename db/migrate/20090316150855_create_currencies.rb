class CreateCurrencies < ActiveRecord::Migration
  def self.up
    create_table :currencies do |t|
      t.string :name
      t.string :sign
      t.text :description
      t.integer :wq1
      t.integer :wq2
      t.integer :wq3
      t.integer :wq4
      t.integer :divide_factor
      t.integer :pay_at      
      t.timestamps
    end

    Currency.create! :name => "EUR", :sign => "EUR", :wq1 => 5, :wq2 => 7, :wq3 => 10, :wq4 => 20, :divide_factor => 1000, :sign => "after,EUR", :pay_at => 15000
    Currency.create! :name => "CLP", :sign => "$", :wq1 => 17, :wq2 => 23, :wq3 => 34, :wq4 => 65, :divide_factor => 10, :sign => "before,$", :pay_at => 100000

  end

  def self.down
    drop_table :currencies
  end
end
