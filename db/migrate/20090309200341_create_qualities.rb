class CreateQualities < ActiveRecord::Migration
  def self.up
    create_table :qualities do |t|
      t.integer :stars
      t.string :name
      t.text :description
      t.timestamps
    end
    
    Quality.create :stars => 1, :name => "pobre"
    Quality.create :stars => 2, :name => "media"
    Quality.create :stars => 3, :name => "buena"
    Quality.create :stars => 4, :name => "profesional"

  end

  def self.down
    drop_table :qualities
  end
end
