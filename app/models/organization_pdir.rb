class OrganizationPdir < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    pd_email :string
    pd_phone :string
    source   :string
    verified :boolean
    remarks  :text
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
