# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


artist = Artist.create!(:name => 'Miles Davis')

albums = [ 
  {
    :title => 'Kind of Blue', 
    :year => 1959, 
    :quality => 'mint'
  },
  {
    :title => 'Miles Ahead', 
    :year => 1957, 
    :quality => 'good'
  },
  {
    :title => 'Seven Steps to Heaven', 
    :year => 1963, 
    :quality => 'poor'
  }
]

albums.each do |album|
  artist.albums.create!(album)
end
                       
artist = Artist.create!(:name => 'Sonny Rollins')

albums =  [
  {
    :title => 'Saxophone Colossus', 
    :year => 1956, 
    :quality => 'mint'
  },
  {
    :title => 'Tenor Madness', 
    :year => 1957, 
    :quality => 'good'
  },
  {
    :title => 'Way Out West', 
    :year => 1958, 
    :quality => 'average'
  }
]

albums.each do |album|
  artist.albums.create!(album)
end
                       
artist = Artist.create!(:name => 'Oscar Peterson')

albums = [ 
  {
    :title => 'Night Train', 
    :year => 1962, 
    :quality => 'average'
  },
  {
    :title => 'Ben Webster Meets Oscar Peterson', 
    :year => 1957, 
    :quality => 'mint'
  },
  {
    :title => 'The Trio: Live From Chicago', 
    :year => 1961, 
    :quality => 'poor'
  }
]

albums.each do |album|
  artist.albums.create!(album)
end
