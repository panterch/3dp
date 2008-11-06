class Photo < ActiveRecord::Base

  belongs_to :category

  has_attachment :content_type => ['image/tiff', :image],
                 :storage => :file_system,
                 :max_size => 10.megabyte,
                 :thumbnails => { :gal => '600x600>', :thumb => '100x100>' }

  validates_presence_of :category_id, :name, :description
  validates_as_attachment

end
