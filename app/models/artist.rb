class Artist < ActiveRecord::Base

  has_many :albums, :dependent => :destroy
  
  has_one :first_album,
          :class_name => "Album",
          :order => "year"
  
end
