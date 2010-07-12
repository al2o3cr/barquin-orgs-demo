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

ActiveRecord::Schema.define(:version => 20100712022842) do

  create_table "grantee_types", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organization_addrs", :force => true do |t|
    t.integer  "seq"
    t.string   "duns_number"
    t.string   "recipient_st_addr1"
    t.string   "recipient_st_addr2"
    t.string   "recipient_city_name"
    t.string   "recipient_state_name"
    t.string   "recipient_zip_code"
    t.string   "recipient_country_code"
    t.string   "source"
    t.boolean  "verified",               :default => false
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  add_index "organization_addrs", ["organization_id"], :name => "index_organization_addrs_on_organization_id"

  create_table "organization_duns", :force => true do |t|
    t.string   "duns_number"
    t.string   "source"
    t.boolean  "verified"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  add_index "organization_duns", ["organization_id"], :name => "index_organization_duns_on_organization_id"

  create_table "organization_pdirs", :force => true do |t|
    t.string   "pd_email"
    t.string   "pd_phone"
    t.string   "source"
    t.boolean  "verified"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  add_index "organization_pdirs", ["organization_id"], :name => "index_organization_pdirs_on_organization_id"

  create_table "organization_types", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.boolean  "partner_flag"
    t.string   "division_station_code"
    t.string   "organization_system_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.boolean  "active",                      :default => true
    t.string   "duns_number"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city_name"
    t.string   "county_name"
    t.string   "state_code"
    t.string   "country_name"
    t.string   "postal_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "congressional_district_code"
    t.boolean  "primary_flag",                :default => true
    t.integer  "organization_type_id"
    t.integer  "grantee_type_id"
  end

  add_index "organizations", ["grantee_type_id"], :name => "index_organizations_on_grantee_type_id"
  add_index "organizations", ["organization_type_id"], :name => "index_organizations_on_organization_type_id"
  add_index "organizations", ["state_id"], :name => "index_organizations_on_state_id"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "region_id"
  end

  add_index "states", ["region_id"], :name => "index_states_on_region_id"

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
