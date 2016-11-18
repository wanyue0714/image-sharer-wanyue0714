require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'persist user email in lowercase' do
    user = User.create! user_params(email: 'HELLO@Wor.lD')
    assert_equal 'hello@wor.ld', user.email
  end

  test 'valid user' do
    assert_predicate User.new(user_params), :valid?
  end

  test 'validate user on minimum length of name' do
    [nil, '', 'abc'].each do |name|
      user = User.new user_params(name: name)
      assert_predicate user, :invalid?
      assert_equal({ name: ['is too short (minimum is 4 characters)'] },
                   user.errors.messages)
    end
    assert_predicate User.new(user_params(name: 'abcd')), :valid?
  end

  test 'validate user on minimum length of password' do
    user = User.new user_params(password: 'abcde')
    assert_predicate user, :invalid?
    assert_equal({ password: ['is too short (minimum is 6 characters)'] },
                 user.errors.messages)

    assert_predicate User.new(user_params(password: 'abcdef')), :valid?
  end

  test 'validate user on presence of password' do
    [nil, ''].each do |password|
      user = User.new user_params(password: password)
      assert_predicate user, :invalid?
      assert_equal({ password: ["can't be blank"] }, user.errors.messages)
    end
  end

  test 'validate user with duplicate email' do
    existing = User.create! user_params
    user = User.new user_params
    assert_predicate user, :invalid?
    assert_equal({ email: ['has already been taken'] }, user.errors.messages)
    # Verify case insensitive comparison
    user = User.new user_params(email: existing.email.upcase)
    assert_predicate user, :invalid?
    assert_equal({ email: ['has already been taken'] }, user.errors.messages)
  end

  test 'validate user with invalid email format' do
    [nil, '', 'user_at_blah.com'].each do |email|
      user = User.new user_params(email: email)
      assert_predicate user, :invalid?
      assert_equal({ email: ['is invalid'] }, user.errors.messages)
    end
  end

  test 'validate user with mismatched passwords' do
    user = User.new user_params(password_confirmation: '')
    assert_predicate user, :invalid?
    assert_equal({ password_confirmation: ["doesn't match Password"] },
                 user.errors.messages)
  end

  private

  def user_params(email: 'fake@user.com', name: 'Fake User', password: 'password',
                  password_confirmation: nil)
    { email: email, name: name, password: password,
      password_confirmation: password_confirmation }
  end
end
