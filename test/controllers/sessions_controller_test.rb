require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'new session' do
    get new_session_path
    assert_response :ok
    assert_select 'h1', 'Log In'
    assert_select "form[action='#{new_session_path}']"
  end
end
