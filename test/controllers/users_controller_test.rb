require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'new user' do
    get new_user_path
    assert_response :ok
    assert_select 'h1', 'Sign Up'
    assert_select "form[action='#{new_user_path}']"
  end
end
