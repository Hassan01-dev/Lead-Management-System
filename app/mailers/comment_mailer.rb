# frozen_string_literal: true

class CommentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.comment_create.subject
  #
  def comment_create
    @comment = params[:comment]
    @phase = @comment.phase
    @user = @params[:user]
    mail to: @phase.user.email,
         subject: 'Comment Created'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.comment_edit.subject
  #
  def comment_edit
    @comment = params[:comment]
    @phase = @comment.phase
    @user = @params[:user]
    mail to: [@phase.user.email, @comment.user.email],
         subject: 'Comment Edited'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.comment_deleted.subject
  #
  def comment_deleted
    @comment = params[:comment]
    @phase = @comment.phase
    @user = @params[:user]
    mail to: [@phase.user.email, @comment.user.email],
         subject: 'Comment deleted'
  end
end
