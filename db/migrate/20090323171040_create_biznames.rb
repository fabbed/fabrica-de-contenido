class CreateBiznames < ActiveRecord::Migration
  def self.up
    create_table :biznames do |t|

      t.string :name
      t.string :tagline
      t.text :comment
      t.string :friend
      t.timestamps
    end
  end

  def self.down
    drop_table :biznames
  end
end
