# frozen_string_literal: true

require 'test_helper'

class PhaseMailerTest < ActionMailer::TestCase
  test 'phase_created' do
    mail = PhaseMailer.phase_created
    assert_equal 'Phase created', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'phase_deleted' do
    mail = PhaseMailer.phase_deleted
    assert_equal 'Phase deleted', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'phase_update' do
    mail = PhaseMailer.phase_update
    assert_equal 'Phase update', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'phase_status' do
    mail = PhaseMailer.phase_status
    assert_equal 'Phase status', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'phase_assigned_TM' do
    mail = PhaseMailer.phase_assigned_TM
    assert_equal 'Phase assigned tm', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
