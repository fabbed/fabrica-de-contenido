class AddIpToBiznames < ActiveRecord::Migration
  def self.up
    add_column :biznames, :ip, :string
    add_column :biznames, :lng, :float, :limit => 8
    add_column :biznames, :lat, :float, :limit => 8    
    add_column :biznames, :country_code, :string
  end

  def self.down
    remove_column :biznames, :ip
    remove_column :biznames, :lng
    remove_column :biznames, :lat       
  end
end
