require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
    
  context "An Artist Instance" do
    setup do
      @artist = Factory(:miles)
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
