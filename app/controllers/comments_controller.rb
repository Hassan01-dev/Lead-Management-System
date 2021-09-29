# frozen_string_literal: true

class CommentsController < ApplicationController
  layout 'dashboard'
  before_action :find_comment, only: %i[show edit update destroy] # rubocop:disable Rails/LexicallyScopedActionFilter
  before_action :find_phase, only: %i[new index create] # rubocop:disable Rails/LexicallyScopedActionFilter

  def new # rubocop:disable Metrics/AbcSize
    if current_user.has_role? :BD
      @comment = Comment.new
    elsif @phase.is_accepted
      if (current_user == @phase.user) || @phase.assigned_engineer?(current_user)
        @comment = Comment.new
      else
        flash[:alert] = 'You are not authorized to perform this action'
        redirect_to phase_path(@phase)
      end
    else
      flash[:alert] = 'You are not authorized to perform this action'
      redirect_to phase_path(@phase)
    end
  end

  def create # rubocop:disable Metrics/AbcSize
    if current_user == @phase.user || @phase.assigned_engineer?(current_user) || (current_user.has_role? :BD)
      @comment = @phase.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        CommentMailer.with(comment: @comment, user: current_user).comment_create.deliver_later
        flash[:success] = 'Comment Created Successfully.'
        redirect_to phase_path(@phase)
      else
        render new
      end
    else
      flash[:alert] = 'You are not authorized to perform this action'
      redirect_to phase_path(@phase)
    end
  end

  def edit
    unless current_user && ((current_user == @comment.user) || (current_user.has_role? :BD)) # rubocop:disable Style/GuardClause
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to phase_path(@comment.phase)
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
    @comment.destroy
    CommentMailer.with(comment: @comment, user: current_user).comment_deleted.deliver_later
    flash[:alert] = 'Comment Deleted Successfully.'

    respond_to do |format|
      format.html { redirect_to phase_path(@phase) }
      format.js
    end
  end

  def delete_image
    @comment = Comment.find(params[:id])
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
