require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  Factory.define :album do |album|
    album.title   "Kind of Blue"
    album.year    1959
    album.quality "mint"
    album.association :artist, :factory => :artist
  end
  
  Factory.define :artist do |artist|
    artist.name "Miles Davis"
  end
  
  context "An Album Instance" do
    setup do
      @album = Factory(:album)
    end

    should "return its name" do
      assert_equal "Kind of Blue", @album.title
    end
    
    should "return its year" do
      assert_equal 1959, @album.year
    end
    
    should "return its quality" do
      assert_equal "mint", @album.quality
    end
    
    context "has an Artist" do
      setup do
        @album.artist = Factory(:artist)
      end

      should "have an artist" do
        assert_equal true, @album.artist.kind_of?(Artist)
      end
    end
    
    context "testing time-related named scopes" do
      setup do
        @earlier_album = Factory(:album, :title => "Miles Ahead", :year => 1957)
      end

      should "return earliest album" do
        assert_equal @earlier_album, Album.earliest.first
        assert_equal 1957, Album.earliest.first.year
      end
      
      should "return latest album" do
        assert_equal @album, Album.latest.first
        assert_equal 1959, Album.latest.first.year
      end
    end
    
    context "testing album condition" do
      setup do
        @good_album = Factory(:album, :title => "Miles Ahead", :year => 1957, :quality => "good")
      end

      should "return albums in mint condition" do
        @albums = Album.quality("mint")
        assert_equal 1, @albums.size
        assert_equal "Kind of Blue", @albums.first.title
      end
      
      should "return albums in good condition" do
        @albums = Album.quality("good")
        assert_equal 1, @albums.size
        assert_equal @good_album, @albums.first
        assert_not_equal "mint", @albums.first.quality
      end
    end
    
    
  end
  

end
