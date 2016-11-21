require 'test_helper'

class SessionFormTest < ActiveSupport::TestCase
  include TestParams

  test 'valid session form' do
    assert_predicate SessionForm.new(session_form_params), :valid?
  end

  test 'validate session form on minimum length of password' do
    [nil, '', 'abcde'].each do |password|
      session_form = SessionForm.new session_form_params(password: password)
      assert_predicate session_form, :invalid?
      assert_equal({ password: ['is too short (minimum is 6 characters)'] },
                   session_form.errors.messages)
    end

    assert_predicate SessionForm.new(session_form_params(password: 'abcdef')), :valid?
  end

  test 'validate session form with invalid email format' do
    [nil, '', 'user_at_blah.com'].each do |email|
      session_form = SessionForm.new session_form_params(email: email)
      assert_predicate session_form, :invalid?
      assert_equal({ email: ['is invalid'] }, session_form.errors.messages)
    end
  end
end
