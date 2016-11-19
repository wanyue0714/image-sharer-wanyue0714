ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

module TestParams
  def user_params(email: 'fake@user.com', name: 'Fake User', password: 'password',
                  password_confirmation: nil)
    { email: email, name: name, password: password,
      password_confirmation: password_confirmation || password }
  end
end
