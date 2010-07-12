class CreateAllStuff < ActiveRecord::Migration
  def self.up
    create_table :organization_duns do |t|
      t.string   :duns_number
      t.string   :source
      t.boolean  :verified
      t.text     :remarks
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :organization_id
    end
    add_index :organization_duns, [:organization_id]

    create_table :organization_pdirs do |t|
      t.string   :pd_email
      t.string   :pd_phone
      t.string   :source
      t.boolean  :verified
      t.text     :remarks
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :organization_id
    end
    add_index :organization_pdirs, [:organization_id]

    create_table :organization_addrs do |t|
      t.integer  :seq
      t.string   :duns_number
      t.string   :recipient_st_addr1
      t.string   :recipient_st_addr2
      t.string   :recipient_city_name
      t.string   :recipient_state_name
      t.string   :recipient_zip_code
      t.string   :recipient_country_code
      t.string   :source
      t.boolean  :verified, :default => false
      t.text     :remarks
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :organization_id
    end
    add_index :organization_addrs, [:organization_id]

    create_table :grantee_types do |t|
      t.string   :code
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :organization_types do |t|
      t.string   :code
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :organizations, :duns_number, :string
    add_column :organizations, :address_line_1, :string
    add_column :organizations, :address_line_2, :string
    add_column :organizations, :address_line_3, :string
    add_column :organizations, :city_name, :string
    add_column :organizations, :county_name, :string
    add_column :organizations, :state_code, :string
    add_column :organizations, :country_name, :string
    add_column :organizations, :postal_code, :string
    add_column :organizations, :latitude, :decimal, :precision => 9, :scale => 6
    add_column :organizations, :longitude, :decimal, :precision => 9, :scale => 6
    add_column :organizations, :congressional_district_code, :string
    add_column :organizations, :primary_flag, :boolean, :default => true
    add_column :organizations, :organization_type_id, :integer
    add_column :organizations, :grantee_type_id, :integer
    change_column :organizations, :active, :boolean, :default => true

    add_index :organizations, [:organization_type_id]
    add_index :organizations, [:grantee_type_id]
  end

  def self.down
    remove_column :organizations, :duns_number
    remove_column :organizations, :address_line_1
    remove_column :organizations, :address_line_2
    remove_column :organizations, :address_line_3
    remove_column :organizations, :city_name
    remove_column :organizations, :county_name
    remove_column :organizations, :state_code
    remove_column :organizations, :country_name
    remove_column :organizations, :postal_code
    remove_column :organizations, :latitude
    remove_column :organizations, :longitude
    remove_column :organizations, :congressional_district_code
    remove_column :organizations, :primary_flag
    remove_column :organizations, :organization_type_id
    remove_column :organizations, :grantee_type_id
    change_column :organizations, :active, :boolean

    drop_table :organization_duns
    drop_table :organization_pdirs
    drop_table :organization_addrs
    drop_table :grantee_types
    drop_table :organization_types

    remove_index :organizations, :name => :index_organizations_on_organization_type_id rescue ActiveRecord::StatementInvalid
    remove_index :organizations, :name => :index_organizations_on_grantee_type_id rescue ActiveRecord::StatementInvalid
  end
end
