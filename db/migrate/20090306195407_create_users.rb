class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code, :string, :limit => 40
      t.column :activated_at, :datetime
      t.string :type
      t.string  :currency, :limit => 3      #for displaying
      
      #Money
      t.integer :cuenta_in_cents,         :default => 0   #for authors
      t.integer :received_in_cents,       :default => 0   #for authors and distributors
      t.string  :cuenta_currency

      t.integer :commission_percentage,       :default => 10   #for distributors

      #For Distributor only
      t.belongs_to :liquidez


      t.string :name
      t.string :surname
      t.belongs_to :country
      t.belongs_to :distributor
      t.string :city
      t.string :address1
      t.string :distributor_code
      t.string :gender,           :limit => 6, :null => false
      t.date   :birth_date,       :null => false
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer  :avatar_file_size
      t.datetime :avatar_updated_at           
    end

      standard_data = {
        :password => "red098", 
        :password_confirmation => "red098", 
        :gender => "female", 
        :birth_date => "14.02.1983", 
        :country_id => Country.find_by_name("España").id,
        :currency => "CLP"
      }

    admins_to_create=[
        {:login => "elena",  :name => "Elena", :surname => "Contioso Fleming", :email => "elena_admin@xalut.com",  :gender => "female"},
        {:login => "fabian", :name => "Fabian", :surname => "Dittrich", :email => "fabian.dittrich@gmail.com", :gender => "male"}]

    distributors_to_create=[
        {:cuenta_currency => "CLP", :login => "julian", :name => "Julian", :surname => "Fuentealba", :email => "julian_distributor@xalut.com", :gender => :male},
        {:cuenta_currency => "CLP", :login => "peter", :name => "Peter", :surname => "Baker", :email => "peter_distributor@xalut.com", :gender => :male}]
      
    admins_to_create.each do |user_hash|
      user = Administrator.new(standard_data.merge(user_hash))
      user.activate
      user.currency = "CLP"
      user.save!
    end

    distributors_to_create.each do |user_hash|
      user = Distributor.new(standard_data.merge(user_hash))
      user.activate
      user.currency = "CLP"
      user.save!
    end

    DistributorCode.create(:code => "santiago_de_chile",  :user_id => User.find_by_login("julian").id, :user_count => 0)



    # authors_to_create=[
    #     {:distributor_code => "santiago_de_chile",  :login => "brad", :name => "Brad", :surname => "Pit", :email => "brad_author@xalut.com", :password => "red098", :password_confirmation => "red098", :gender => "male", :birth_date => "14.02.1983", :address1 => "Cale Suecia 2094", :city => "Santiago de Chile", :country_id => 440, :distributor_id => User.find_by_login("julian").id},
    #     {:distributor_code => "santiago_de_chile",  :login => "johnny", :name => "johnny", :surname => "Depp", :email => "johnny_author@xalut.com", :password => "red098", :password_confirmation => "red098", :gender => "male", :birth_date => "14.02.1983", :address1 => "Cale Suecia 2094", :city => "Santiago de Chile", :country_id => 440, :distributor_id => User.find_by_login("julian").id}
    #     ]
    # 
    # authors_to_create.each do |user_hash|
    #   user = Author.new(standard_data.merge(user_hash))
    #   user.activate
    #   user.currency = "CLP"
    #   user.save!
    # end



   User.all.each do |user|
     my_file = 'public/images/standard_users/'+user.name+'.jpg'
     f = File.open(my_file, 'r')
     file_data = f.read
     user.cuenta_currency = "CLP"
     user.avatar = f
     user.save

     f.close
    end



  end

  def self.down
    drop_table "users"
  end
end