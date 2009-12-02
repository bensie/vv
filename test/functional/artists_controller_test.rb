require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  
  Factory.define :miles, :class => :artist do |artist|
    artist.name "Miles Davis"
  end
  
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
  
  context "edit an Artist" do
    setup do
      @artist = Factory(:miles)
      # @album = Factory(:kind_of_blue, :artist => @artist)
      get :edit, :id => @artist.id
    end

    should_assign_to :artist
    should_respond_with :success
    should_render_template :edit

    should "add a new Album to an Artist" do
      
    end
  end

end