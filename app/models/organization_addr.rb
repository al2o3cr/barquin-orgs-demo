class OrganizationAddr < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    seq                    :integer
    duns_number            :string
    recipient_st_addr1     :string
    recipient_st_addr2     :string
    recipient_city_name    :string
    recipient_state_name   :string
    recipient_zip_code     :string
    recipient_country_code :string
    source                 :string
    verified               :boolean, :default => false
    remarks                :text
    timestamps
  end

  belongs_to :organization

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
