require 'test_helper'

class CommentMailerTest < ActionMailer::TestCase
  test "comment_create" do
    mail = CommentMailer.comment_create
    assert_equal "Comment create", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "comment_edit" do
    mail = CommentMailer.comment_edit
    assert_equal "Comment edit", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "comment_deleted" do
    mail = CommentMailer.comment_deleted
    assert_equal "Comment deleted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
