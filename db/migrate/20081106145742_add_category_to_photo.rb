class AddCategoryToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :category_id, :integer
  end

  def self.down
    remove_column :photos, :category_id
  end
end
