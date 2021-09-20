# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :phase
  has_many_attached :images

  # after_create :confirmation_mail_create
  # after_update :confirmation_mail_update
  # after_destroy :confirmation_mail_destroy

  # private

  # def confirmation_mail_create
  #   CommentMailer.with(comment: @comment, user: current_user).comment_create.deliver_later
  #   flash[:success] = 'Comment Created Successfully.'
  # end

  # def confirmation_mail_update
  #   CommentMailer.with(comment: @comment, user: current_user).comment_edit.deliver_later
  #   flash[:notice] = 'Comment Updated Successfully.'
  # end

  # def confirmation_mail_destroy
  #   CommentMailer.with(comment: @comment, user: current_user).comment_deleted.deliver_later
  #   flash[:alert] = 'Comment Deleted Successfully.'
  # end
end
