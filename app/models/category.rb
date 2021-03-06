class Category < ActiveRecord::Base

  validates_uniqueness_of :title
  has_many :photos, :order => "updated_at DESC", :dependent => :destroy

end
