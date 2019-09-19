require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:jim)
  end

  test "account_activation" do
    @user.activation_token = User.generate_token
    mail = UserMailer.account_activation(@user)
    assert_equal "Activate your Chipper Account", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["noreply@chipper-io.com"], mail.from
  end

  test "password_reset" do
    mail = UserMailer.password_reset(user)
    assert_equal "Password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["noreply@chipper-io.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
