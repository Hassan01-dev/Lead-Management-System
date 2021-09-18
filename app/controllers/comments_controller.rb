# frozen_string_literal: true

class CommentsController < ApplicationController
  layout 'dashboard'
  before_action :find_comment, only: %i[show edit update destroy] # rubocop:disable Rails/LexicallyScopedActionFilter
  before_action :find_phase, only: %i[index create] # rubocop:disable Rails/LexicallyScopedActionFilter

  def new
    @comment = Comment.new
  end

  def create
    @comment = @phase.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      CommentMailer.with(comment: @comment, user: current_user).comment_create.deliver_later
      flash[:success] = 'Comment Created Successfully.'
      redirect_to phase_path(@phase)
    else
      render new
    end
  end

  def update
    if @comment.update(comment_params)
      CommentMailer.with(comment: @comment, user: current_user).comment_edit.deliver_later
      flash[:notice] = 'Comment Updated Successfully.'
      redirect_to phase_path(@comment.phase)
    else
      render :edit
    end
  end

  def destroy
    @phase = Comment.find(params[:id]).phase
    CommentMailer.with(comment: @comment, user: current_user).comment_deleted.deliver_later
    @comment.destroy
    flash[:alert] = 'Comment Deleted Successfully.'
    redirect_to phase_path(@phase)
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
