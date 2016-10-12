require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: albums(:spiceworld).id }
    assert_response :success
    assert_template :show
  end

  test "should get edit" do
    get :edit, {id: albums(:spiceworld).id }
    assert_response :success
    assert_template :edit
  end

  # test "should update an album" do
  #   get :update, {id: albums(:spiceworld).id }
  #   assert_response :success
  #   assert_response :redirect
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should delete an album" do
    delete :destroy, {id: albums(:spiceworld).id }
    assert_response :redirect
  end

  test "deleting an album should change the number of albums" do
    assert_difference("Album.count", -1) do
    delete :destroy,  {id: albums(:spiceworld).id }
    end
  end

  test "should create an album" do
    params = {album:{name: "Mmmbop", artist: "Hanson", description: "Mmmbop will be stuck in your head for the entire 90s - sorry.", votes: 0}}
    post :create, params
    assert_response :redirect
  end

  test "creating an album should change the number of albums" do
    assert_difference("Album.count", 1) do
    params = {album:{name: "Mmmbop", artist: "Hanson", description: "Mmmbop will be stuck in your head for the entire 90s - sorry.", votes: 0}}
    post :create, params
    end
  end


end
