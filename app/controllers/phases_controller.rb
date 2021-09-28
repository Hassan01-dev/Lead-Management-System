# frozen_string_literal: true

class PhasesController < ApplicationController # rubocop:disable Metrics/ClassLength
  layout 'dashboard'
  before_action :find_phase, only: %i[show edit update destroy] # rubocop:disable Rails/LexicallyScopedActionFilter
  before_action :find_lead, only: %i[index create]
  before_action :find_phase_for_custom_action, only: %i[add_engineer approve accepted]

  def index
    @phases = @lead.phases
  end

  def new
    @phase = Phase.new
    authorize @phase
  end

  def create # rubocop:disable Metrics/AbcSize
    @phase = @lead.phases.build(phase_params)
    authorize @phase
    @phase.approved = false
    if @phase.save
      PhaseMailer.with(phase: @phase, admin: current_user).phase_created.deliver_later
      PhaseMailer.with(phase: @phase, admin: current_user).phase_assigned_TM.deliver_later
      PhaseExpireMailJob.set(wait: (@phase.end_date - Date.current).days).perform_later(@phase)
      flash[:success] = 'Phase Created Successfully.'
      redirect_to @phase
    else
      render 'new'
    end
  end

  def update
    if @phase.update(phase_params)
      PhaseMailer.with(phase: @phase, admin: current_user).phase_update.deliver_later
      flash[:notice] = 'Phase Updated Successfully.'
      redirect_to @phase
    else
      render :edit
    end
  end

  def destroy
    @phase.destroy
    PhaseMailer.with(phase: @phase, admin: current_user).phase_deleted.deliver_later
    flash[:alert] = 'Phase Deleted Successfully.'
    respond_to do |format|
      format.html { redirect_to lead_phases_path(@phase.lead) }
      format.js
    end
  end

  def approve
    authorize @phase, :update?
    if @phase.toggle!(:approved) # rubocop:disable Rails/SkipsModelValidations
      PhaseMailer.with(phase: @phase, admin: current_user).phase_status.deliver_later
    end
    respond_to do |format|
      format.html { redirect_to lead_phases_path(@phase.lead) }
      format.js
    end
  end

  def accepted
    if @phase.toggle!(:is_accepted) # rubocop:disable Rails/SkipsModelValidations
      redirect_to phase_path(@phase)
    else
      redirect_to lead_phases_path(@phase.lead)
    end
  end

  def add_engineer; end

  def add_engineer_to_phase # rubocop:disable Metrics/AbcSize
    @phase = Phase.find(params[:phase_id])
    @arr = []
    @arr << @phase.assigned_engineer if @phase.assigned_engineer
    @arr << params[:user_id]
    @phase.assigned_engineer = @arr.flatten.uniq
    if @phase.save
      respond_to do |format|
        format.html { redirect_to phase_add_engineer_path(@phase) }
        format.js
      end
    else
      flash[:alert] = 'Unknown Error happened'
      redirect_to phase_add_engineer_path(@phase)
    end
  end

  def remove_engineer_from_phase # rubocop:disable Metrics/AbcSize
    @phase = Phase.find(params[:phase_id])
    if @phase.assigned_engineer.empty?
      flash[:alert] = 'There is no one to remove from the list.'
      redirect_to phase_add_engineer_path(@phase)
    else
      @arr = @phase.assigned_engineer
      @arr.delete(params[:user_id])
      @phase.assigned_engineer = @arr
      if @phase.save
        respond_to do |format|
          format.html { redirect_to phase_add_engineer_path(@phase) }
          format.js
        end
      else
        flash[:alert] = 'Unknown Error happened.'
        redirect_to phase_add_engineer_path(@phase)
      end
    end
  end

  private

  def phase_params
    params.require(:phase).permit(:phase_type, :start_date, :end_date, :user_id)
  end

  def find_phase
    @phase = Phase.find(params[:id])
    authorize @phase
  end

  def find_phase_for_custom_action
    @phase = Phase.find(params[:phase_id])
  end

  def find_lead
    @lead = Lead.find(params[:lead_id])
  end
end
