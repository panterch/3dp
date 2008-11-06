class AddFieldsToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :name, :string
    add_column :photos, :description, :text
  end

  def self.down
    remove_column :photos, :description
    remove_column :photos, :name
  end
end
