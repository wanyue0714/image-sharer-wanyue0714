require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include TestParams

  test 'new user' do
    get new_user_path
    assert_response :ok
    assert_select 'h1', 'Sign Up'
    assert_select "form[action='#{users_path}']"
  end

  test 'create valid user' do
    assert_difference 'User.count' do
      post users_path(user: user_params)
    end
    assert_redirected_to new_user_path
    assert_equal 'Created user', flash[:success]
  end

  test 'create invalid user' do
    assert_no_difference 'User.count' do
      post users_path(user: user_params(name: ''))
    end
    assert_response :unprocessable_entity
  end
end
