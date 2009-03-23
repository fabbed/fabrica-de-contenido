class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.belongs_to :author,   :default => nil   
      t.belongs_to :status,   :null => :no, :default => 1
      t.belongs_to :quality,  :default =>3
      t.belongs_to :project,  :default =>1                   

      t.column :keywords,       :string, :limit => 64
      t.column :words_maximum, :integer
      t.column :words_minimum, :integer

      # t.column :earnings_per_word, :integer

      t.column :instructions, :text
      t.column :review_message, :text
      t.column :feedback, :text
      t.column :title, :string, :limit => 250      
      t.column :body, :text
      t.column :words, :integer
      t.timestamps
    end
    
    Job.create!(
    :keywords => "Conocer chicos calientes",
    :words_minimum => 223,
    :words_maximum => 320,
    :instructions => "Mach dies, mach das und so weiter und sofort...",
    :title => "Irgendein titel",
    :body => "Irgendein Body mit vielen Wörtern, Irgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen WörternIrgendein Body mit vielen Wörtern"
    )

    Job.create!(
    :keywords => "Conocer personas",
    :instructions => "Mach dies, mach das und so weiter und sofort...",
    :words_minimum => 223,
    :words_maximum => 320
    )
    
    Job.create!(
    :keywords => "Conocer alguien",
    :instructions => "Mach dies, mach das und so weiter und sofort...",
    :words_minimum => 223,
    :words_maximum => 320)
    
  end

  def self.down
    drop_table :jobs
  end
end


