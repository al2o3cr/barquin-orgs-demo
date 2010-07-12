class OrganizationsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  index_action :active do
    hobo_index Organization.active, :order => 'name ASC'
  end

end
