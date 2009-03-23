class CreateDistributorCodes < ActiveRecord::Migration
  def self.up
    create_table :distributor_codes do |t|
      t.string :code
      t.belongs_to  :user
      t.integer :user_count
    end

  end

  def self.down
    drop_table :distributor_codes
  end
end
