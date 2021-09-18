# frozen_string_literal: true

class PhasesController < ApplicationController
  layout 'dashboard'
  before_action :find_phase, only: %i[show edit update destroy] # rubocop:disable Rails/LexicallyScopedActionFilter
  before_action :find_lead, only: %i[index create]
  before_action :find_phase_for_custom_action, only: %i[add_engineer approve]

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
    redirect_to lead_phases_path(@phase.lead)
  end

  def approve
    if @phase.toggle!(:approved) # rubocop:disable Rails/SkipsModelValidations
      PhaseMailer.with(phase: @phase, admin: current_user).phase_status.deliver_later
    end
    redirect_to lead_phases_path(@phase.lead)
  end

  def add_engineer; end

  private

  def phase_params
    params.require(:phase).permit(:phase_type, :start_date, :end_date, :user_id, :approved, assigned_engineer: [])
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
