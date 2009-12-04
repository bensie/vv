require 'httparty'

class Album < ActiveRecord::Base

  include HTTParty

  has_attached_file :artwork,
                    :styles => {
                      :thumbnail => "100x100#",
                      :cover => "400x400#"
                    }

  # validates_attachment_presence :artwork
  validates_attachment_content_type :artwork, :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png'], :allow_blank => true
  
  has_many :songs

  belongs_to :artist
  
  # validates_presence_of :artist

  named_scope :earliest, :order => :year, :limit => 1
  named_scope :latest, :order => "year DESC", :limit => 1
  
  named_scope :quality, lambda { |quality| { :conditions => ['quality = ?', quality] } }  

  def get_price
    begin
      Album.post(
        "http://chadfowler.com:9090/pricing",
        :body => [{
          :name => title, :artist => artist.name
        }].to_json
      ).first["price"]      
    rescue Errno::ECONNREFUSED
      "N/A"
    rescue
      "Foo"
    end
  end

end
