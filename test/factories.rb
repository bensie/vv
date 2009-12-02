 #artists
  
  Factory.define :miles, :class => :artist do |artist|
    artist.name "Miles Davis"
  end
  
  Factory.define :thelonious, :class => :artist do |artist|
    artist.name "Thelonious Monk"
  end
 
 #albums
  Factory.define :kind_of_blue, :class => :album do |album|
    album.title "Kind of Blue"
    album.year  1959
    album.quality "mint"
    album.artist { |artist| artist.association(:miles) }
  end

  Factory.define :miles_ahead, :class => :album do |album|
    album.title "Miles Ahead"
    album.year  1957
    album.quality "mint"
    album.artist { |artist| artist.association(:miles) }
  end
  
