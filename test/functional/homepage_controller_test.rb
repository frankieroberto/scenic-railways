require 'test_helper'

class HomepageControllerTest < ActionController::TestCase

  test "homepage" do
    get :show

    assert_response :success

  end

end
