# frozen_string_literal: true

require 'test_helper'

class LeadMailerTest < ActionMailer::TestCase
  test 'lead_created' do
    mail = LeadMailer.lead_created
    assert_equal 'Lead created', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'lead_deleted' do
    mail = LeadMailer.lead_deleted
    assert_equal 'Lead deleted', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'lead_update' do
    mail = LeadMailer.lead_update
    assert_equal 'Lead update', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end

  test 'lead_status' do
    mail = LeadMailer.lead_status
    assert_equal 'Lead status', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
