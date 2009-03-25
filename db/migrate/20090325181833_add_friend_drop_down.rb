class AddFriendDropDown < ActiveRecord::Migration
  def self.up
    add_column :biznames, :affiliate, :string
  end

  def self.down
    remove_column :biznames, :affiliate
  end
end
