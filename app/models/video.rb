class Video < ActiveRecord::Base

  belongs_to :photo

  has_attachment :storage => :file_system

end
