require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    get :show, {id: movies(:little_mermaid).id }
    assert_response :success
    assert_template :show
  end

  test "should get edit" do
    get :edit, {id: movies(:little_mermaid).id }
    assert_response :success
    assert_template :edit
  end

  # test "should update a book" do
  #   get :update, {id: books(:matilda).id }
  #   assert_response :success
  #   assert_response :redirect
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should delete a movie" do
    delete :destroy, {id: movies(:little_mermaid).id }
    assert_response :redirect
  end

  test "deleting a movie should change the number of movies" do
    assert_difference("Movie.count", -1) do
    delete :destroy,  {id: movies(:little_mermaid).id }
    end
  end

  test "should create a movie" do
    params = {movie:{name: "Land Before Time", director: "Mr. Dinosaur", description: "A never-ending series about cute dinosaurs", votes: 0}}
    post :create, params
    assert_response :redirect
  end

  test "creating a movie should change the number of movies" do
    assert_difference("Movie.count", 1) do
    params = {movie:{name: "Land Before Time", director: "Mr. Dinosaur", description: "A never-ending series about cute dinosaurs", votes: 0}}
    post :create, params
    end
  end


end
