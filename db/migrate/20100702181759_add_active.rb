class AddActive < ActiveRecord::Migration
  def self.up
    add_column :organizations, :active, :boolean
  end

  def self.down
    remove_column :organizations, :active
  end
end
