require 'test_helper'

class PerfilControllerTest < ActionController::TestCase
  test "should get adicionarAmigo" do
    get :adicionarAmigo
    assert_response :success
  end

end
