class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string   :name
      t.boolean  :partner_flag
      t.string   :division_station_code
      t.string   :organization_system_name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :state_id
    end
    add_index :organizations, [:state_id]

    create_table :regions do |t|
      t.string   :name
      t.string   :code
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :states do |t|
      t.string   :name
      t.string   :code
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :region_id
    end
    add_index :states, [:region_id]

    create_table :users do |t|
      t.string   :crypted_password, :limit => 40
      t.string   :salt, :limit => 40
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :name
      t.string   :email_address
      t.boolean  :administrator, :default => false
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :state, :default => "active"
      t.datetime :key_timestamp
    end
    add_index :users, [:state]
  end

  def self.down
    drop_table :organizations
    drop_table :regions
    drop_table :states
    drop_table :users
  end
end
