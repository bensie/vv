class Album < ActiveRecord::Base

  belongs_to :artist
  
  # validates_presence_of :artist

  named_scope :earliest, :order => :year, :limit => 1
  named_scope :latest, :order => "year DESC", :limit => 1
  
  named_scope :quality, lambda { |quality| { :conditions => ['quality = ?', quality] } }  

end
