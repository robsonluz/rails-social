require 'test_helper'

class GrupoControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
