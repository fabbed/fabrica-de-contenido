class AddEmailToBiznames < ActiveRecord::Migration
  def self.up
    add_column :biznames, :email, :string
  end

  def self.down
    remove_column :biznames, :email
  end
end
