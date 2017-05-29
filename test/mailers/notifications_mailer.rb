require 'test_helper'

class NotificationsMailerTest < ActionMailer::TestCase
  test "favorite" do
    mail = NotificationsMailer.favorites
    assert_equal "Favorites", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
