class Photo < ActiveRecord::Base

  belongs_to :category

  has_attachment :content_type => [:image],
                 :storage => :file_system,
                 :max_size => 10.megabyte,
                 :processor => :Rmagick,
                 :thumbnails => { :gallery => '300', :thumb => '150x150>' }

  #validates_presence_of :category_id, :name, :description,
  #                      :unless => Proc.new { |p| p.parent_id.nil? }

  validates_as_attachment

  def after_save
    return if parent_id
  end

end
