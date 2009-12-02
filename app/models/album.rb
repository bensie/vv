class Album < ActiveRecord::Base

  has_attached_file :artwork,
                    :styles => {
                      :thumbnail => "100x100#",
                      :cover => "400x400#"
                    }

  validates_attachment_presence :artwork
  validates_attachment_content_type :artwork, :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png']
  

  belongs_to :artist
  
  # validates_presence_of :artist

  named_scope :earliest, :order => :year, :limit => 1
  named_scope :latest, :order => "year DESC", :limit => 1
  
  named_scope :quality, lambda { |quality| { :conditions => ['quality = ?', quality] } }  

end
