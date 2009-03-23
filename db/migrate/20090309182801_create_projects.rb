class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.belongs_to :administrator

      t.timestamps
    end
    
    Project.create!(:name => "Libre", :administrator => Administrator.find_by_login("fabian"), :description => "xxx")
    Project.create!(:name => "dietas-y-nutricion.com", :administrator => Administrator.find_by_login("fabian"), :description => "xxx")
    Project.create!(:name => "enfermedades-sexuales.com", :administrator => Administrator.find_by_login("fabian"), :description => "xxx")
    
    
  end

  def self.down
    drop_table :projects
  end
end
