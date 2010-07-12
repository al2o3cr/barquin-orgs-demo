class Region < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    code :string
    timestamps
  end

  has_many :states
  has_many :organizations, :through => :states

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
