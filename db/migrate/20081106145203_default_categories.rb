class DefaultCategories < ActiveRecord::Migration
  def self.up
    titles = %w(Innenansichten Aussenansichten Gesamtübersicht Movie Homepage)
    titles.each do |title|
      Category.create!(:title => title)
    end
  end

  def self.down
    Category.destroy_all
  end
end
