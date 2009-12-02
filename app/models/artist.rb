class Artist < ActiveRecord::Base

  has_many :albums, :dependent => :destroy
  
  has_one :first_album,
          :class_name => "Album",
          :order => "year"
          
  accepts_nested_attributes_for :albums, :allow_destroy => true, :reject_if => lambda { |a| a.values.all?(&:blank?) }
  
end
