# frozen_string_literal: true

class PhasesController < ApplicationController
  layout 'dashboard'
  include FlashMessages
  before_action :find_phase, only: %i[show edit update destroy] # rubocop:disable Rails/LexicallyScopedActionFilter
  before_action :find_lead, only: %i[index create]
  before_action :find_phase_for_custom_action,
                only: %i[new_engineer approve accepted add_engineer_to_phase remove_engineer_from_phase]

  def index
    @phases = @lead.phases
  end

  def new
    @phase = Phase.new
    authorize @phase
  end

  def create
    @phase = @lead.phases.build(phase_params)
    authorize @phase
    if @phase.save
      PhaseMailer.with(phase: @phase, admin: current_user).phase_created.deliver_later
      PhaseMailer.with(phase: @phase, admin: current_user).phase_assigned_TM.deliver_later
      flash_message(I18n.t('phases.messages.create'), @phase)
    else
      render 'new'
    end
  end

  def update
    if @phase.update(phase_params)
      PhaseMailer.with(phase: @phase, admin: current_user).phase_update.deliver_later
      flash_message(I18n.t('phases.messages.update'), @phase)
    else
      render :edit
    end
  end

  def destroy
    @phase.destroy
    PhaseMailer.with(phase: @phase, admin: current_user).phase_deleted.deliver_later
    flash[:alert] = I18n.t('phases.messages.destroy')
  end

  def approve
    authorize @phase, :update?
    PhaseMailer.with(phase: @phase, admin: current_user).phase_status.deliver_later if @phase.toggle!(:approved) # rubocop:disable Rails/SkipsModelValidations
  end

  def accepted
    redirect_to phase_path(@phase) if @phase.toggle!(:is_accepted) # rubocop:disable Rails/SkipsModelValidations
    redirect_to lead_phases_path(@phase.lead)
  end

  def new_engineer; end

  def add_engineer_to_phase
    authorize @phase
    @arr = []
    @arr << @phase.assigned_engineer if @phase.assigned_engineer
    @arr << params[:user_id]
    @phase.assigned_engineer = @arr.flatten.uniq
    flash_message(I18n.t('common_errors.unknown_error'), phase_add_engineer_path(@phase), 'alert') unless @phase.save
  end

  def remove_engineer_from_phase
    authorize @phase
    if @phase.assigned_engineer.empty?
      flash_message(I18n.t('phases.messages.empty_engineer_list'), phase_add_engineer_path(@phase), 'alert')
    end
    @arr = @phase.assigned_engineer
    @arr.delete(params[:user_id])
    @phase.assigned_engineer = @arr
    flash_message(I18n.t('common_errors.unknown_error'), phase_add_engineer_path(@phase), 'alert') unless @phase.save
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
