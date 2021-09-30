# frozen_string_literal: true

class CommentsController < ApplicationController
  layout 'dashboard'
  include FlashMessages
  before_action :find_comment, only: %i[show edit update destroy delete_image] # rubocop:disable Rails/LexicallyScopedActionFilter
  before_action :find_phase, only: %i[new index create] # rubocop:disable Rails/LexicallyScopedActionFilter

  def new
    authorize @phase
    @comment = Comment.new
  end

  def create
    authorize @phase
    @comment = @phase.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      CommentMailer.with(comment: @comment, user: current_user).comment_create.deliver_later
      flash_message(I18n.t('comment.messages.create'), phase_path(@phase))
    else
      render new
    end
  end

  def edit
    unless (current_user == @comment.user) || (current_user.has_role? :BD) # rubocop:disable Style/GuardClause
      flash_message(I18n.t('common_errors.not_authorized'), phase_path(@comment.phase), 'error')
    end
  end

  def update
    if @comment.update(comment_params)
      CommentMailer.with(comment: @comment, user: current_user).comment_edit.deliver_later
      flash_message(I18n.t('comment.messages.update'), phase_path(@comment.phase))
    else
      render :edit
    end
  end

  def destroy
    @phase = @comment.phase
    @comment.destroy
    CommentMailer.with(comment: @comment, user: current_user).comment_deleted.deliver_later
    flash[:alert] = I18n.t('comment.messages.destroy')
  end

  def delete_image
    @comment.images.where(id: params[:format]).purge
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_text, images: [])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_phase
    @phase = Phase.find(params[:phase_id])
  end
end
