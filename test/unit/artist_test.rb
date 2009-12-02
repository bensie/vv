require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  Factory.define :artist do |artist|
    artist.name "Miles Davis"
  end
  
  Factory.define :album do |album|
    album.title "Kind of Blue"
    album.year  1959
    album.quality "mint"
  end
    
  context "An Artist Instance" do
    setup do
      @artist = Factory(:artist)
    end

    should "return its name" do
      assert_equal "Miles Davis", @artist.name
    end
    
    context "Artist has Albums" do
      setup do
        @artist.albums.create!(:title => "Kind of Blue", :year => 1959, :quality => "mint")
        @artist.albums.create!(:title => "Miles Ahead", :year => 1957, :quality => "mint")
      end

      should "have albums" do
        assert_not_equal nil, @artist.albums
        assert_equal @artist, @artist.albums.first.artist
      end
      
      should "return artist's first album" do
        assert_equal @artist.albums.second, @artist.first_album
      end
    end
    
  end

end
