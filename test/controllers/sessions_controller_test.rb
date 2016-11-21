require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  include TestParams

  test 'new session' do
    get new_session_path
    assert_response :ok
    assert_select 'h1', 'Log In'
    assert_select "form[action='#{sessions_path}']"
  end

  test 'create valid session' do
    post sessions_path(session_form: session_form_params)
    assert_redirected_to new_session_path
    assert_equal 'Logged in', flash[:success]
  end

  test 'create invalid session' do
    post sessions_path(session_form: session_form_params(email: ''))
    assert_response :unprocessable_entity
  end
end
