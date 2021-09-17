# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/user_created
  def user_created
    UserMailer.with(admin: User.first, user: User.last).user_created
  end
end
