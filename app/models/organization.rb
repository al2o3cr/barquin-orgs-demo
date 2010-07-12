class Organization < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name                     :string
    partner_flag             :boolean
    division_station_code    :string
    organization_system_name :string
    active :boolean, :default => true
    duns_number :string
    address_line_1 :string
    address_line_2 :string
    address_line_3 :string
    city_name :string
    county_name :string
    state_code :string
    country_name :string
    postal_code :string
    latitude :decimal, :precision => 9, :scale => 6
    longitude :decimal, :precision => 9, :scale => 6
    congressional_district_code :string
    primary_flag :boolean, :default => true
    timestamps
  end

  named_scope :partner, :conditions => { :partner_flag => true }
  named_scope :active, :conditions => { :active => true }

  named_scope :limit, lambda { |l| { :limit => l } }

  belongs_to :state
  has_one :region, :through => :state

  belongs_to :organization_type
  belongs_to :grantee_type

  has_many :addrs, :class_name => 'OrganizationAddr', :dependent => :destroy
  has_many :duns, :class_name => 'OrganizationDun', :dependent => :destroy
  has_many :pdirs, :class_name => 'OrganizationPdir', :dependent => :destroy

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
