class Photo < ActiveRecord::Base

  belongs_to :category
  has_one :video, :dependent => :destroy 

  has_attachment :content_type => [:image],
                 :storage => :file_system,
                 :max_size => 10.megabyte,
                 :processor => :Rmagick,
                 :thumbnails => { :gallery => '282', :thumb => '150x100' }

  validates_as_attachment

end
