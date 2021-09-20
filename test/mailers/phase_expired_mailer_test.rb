require 'test_helper'

class PhaseExpiredMailerTest < ActionMailer::TestCase
  test "phase_expired" do
    mail = PhaseExpiredMailer.phase_expired
    assert_equal "Phase expired", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
