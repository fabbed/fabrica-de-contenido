# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090325191547) do

  create_table "biznames", :force => true do |t|
    t.string   "name"
    t.string   "tagline"
    t.text     "comment"
    t.string   "friend"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "affiliate"
    t.string   "ip"
    t.float    "lng"
    t.float    "lat"
    t.string   "country_code"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "iso"
    t.boolean  "visible",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort_order"
    t.integer  "used_id"
  end

  create_table "currencies", :force => true do |t|
    t.string   "name"
    t.string   "sign"
    t.text     "description"
    t.integer  "wq1"
    t.integer  "wq2"
    t.integer  "wq3"
    t.integer  "wq4"
    t.integer  "divide_factor"
    t.integer  "pay_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "distributor_codes", :force => true do |t|
    t.string  "code"
    t.integer "user_id"
    t.integer "user_count"
  end

  create_table "jobs", :force => true do |t|
    t.integer  "author_id"
    t.integer  "status_id",                     :default => 1
    t.integer  "quality_id",                    :default => 3
    t.integer  "project_id",                    :default => 1
    t.string   "keywords",       :limit => 64
    t.integer  "words_maximum"
    t.integer  "words_minimum"
    t.text     "instructions"
    t.text     "review_message"
    t.text     "feedback"
    t.string   "title",          :limit => 250
    t.text     "body"
    t.integer  "words"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "liquid_accounts", :force => true do |t|
    t.integer  "distributor_id"
    t.integer  "owner_id"
    t.integer  "balance_in_cents"
    t.string   "account_currency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "distributor_id"
    t.integer  "amount_in_cents"
    t.string   "currency"
    t.boolean  "is_payed",        :default => false
    t.date     "payed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "administrator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qualities", :force => true do |t|
    t.integer  "stars"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "label"
    t.string   "label_es"
    t.text     "description"
    t.text     "description_es"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "liquid_account_id"
    t.integer  "amount_in_cents"
    t.string   "currency"
    t.string   "transaction_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "type"
    t.string   "currency",                  :limit => 3
    t.integer  "cuenta_in_cents",                         :default => 0
    t.integer  "received_in_cents",                       :default => 0
    t.string   "cuenta_currency"
    t.integer  "commission_percentage",                   :default => 10
    t.integer  "liquidez_id"
    t.string   "name"
    t.string   "surname"
    t.integer  "country_id"
    t.integer  "distributor_id"
    t.string   "city"
    t.string   "address1"
    t.string   "distributor_code"
    t.string   "gender",                    :limit => 6,                  :null => false
    t.date     "birth_date",                                              :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
