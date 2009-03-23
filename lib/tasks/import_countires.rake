#enviroment has to be loaded, to have access to all kinds of models
require 'fastercsv'
require 'iconv'

namespace :delete do

    desc "Migrates DB to Version=0 imports geodata and universities, clones db to test_db, imports data for test_db"
    task :users => :environment do

      ActiveRecord::Base.connection.execute("DELETE from users")
      ActiveRecord::Base.connection.execute("DELETE from profiles")      
      ActiveRecord::Base.connection.execute("DELETE from messages")      
      ActiveRecord::Base.connection.execute("DELETE from match_requests")                  
      ActiveRecord::Base.connection.execute("DELETE from profile_visits")
      ActiveRecord::Base.connection.execute("DELETE from photos where filename NOT LIKE  '%dummy%'")
    end
end

namespace :migrate do

    desc "Migrates DB to Version=0 imports geodata and universities, clones db to test_db, imports data for test_db"
    task :everything => :environment do

      puts
      puts
      puts "___________Automigrating everything_________"
      puts "1. Migrating dev_db to VERSION=0"
      system("rake db:migrate VERSION=0")
      puts "2. Migrating dev_db"
      system("rake db:migrate")
      puts "3. Importing DATA"
      system("rake migrate:all")

    end
end

namespace :import do
  desc "This task will import all countries of the world(in spanish spelling). loaded from a csv file"
  task :countries => :environment do

    FasterCSV.foreach('db/data/spanish_countries.csv') do |row|
      # will convert from UTF8 to UTF16
      #Iconv.new('utf-16', 'utf-8').iconv(person.name)
      Country.create(:name => row[1], :iso => row[0])
    end
    puts "Countries imported from csv file db/data/..."
  end

end
