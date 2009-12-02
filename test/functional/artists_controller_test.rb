require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  
  context "get edit form for an Artist" do
    setup do
      @artist = Factory(:miles)
      @album  = Factory(:kind_of_blue, :artist => @artist)
      get :edit, :id => @artist.id
    end

    should_assign_to :artist
    should_respond_with :success
    should_render_template :edit

    should "have set up Artist object correctly" do
      assert_equal @artist.id, assigns(:artist).id
      assert_equal @artist.albums.first.title, assigns(:artist).albums.first.title
    end
  end
  
  context "update an Artist" do
    setup do
      @artist = Factory(:miles)
      @album  = Factory(:kind_of_blue, :artist => @artist)
      put :update, :id => @artist.id, :artist => {:name => "Foo Bar"}
    end
    
    should_respond_with :redirect

    should "have new name" do
      assert_equal "Foo Bar", Artist.find(@artist.id).name
    end
  end
  

end
