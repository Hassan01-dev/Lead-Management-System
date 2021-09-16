# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/comment_mailer/comment_create
  def comment_create
    CommentMailer.with(comment: Comment.first, user: User.last).comment_create
  end

  # Preview this email at http://localhost:3000/rails/mailers/comment_mailer/comment_edit
  def comment_edit
    CommentMailer.with(comment: Comment.first, user: User.last).comment_edit
  end

  # Preview this email at http://localhost:3000/rails/mailers/comment_mailer/comment_deleted
  def comment_deleted
    CommentMailer.with(comment: Comment.first, user: User.last).comment_deleted
  end

end
