# frozen_string_literal: true

class PhasesController < ApplicationController
  layout 'dashboard'
  before_action :find_phase, only: %i[show edit update destroy]
  before_action :find_lead, only: %i[index create]

  def index
    @phases = @lead.phases
  end

  def show; end

  def new
    @phase = Phase.new
  end

  def create
    @phase = @lead.phases.build(phase_params)
    @phase.approved = false
    if @phase.save
      redirect_to @phase
    else
      render new
    end
  end

  def edit; end

  def update
    if @phase.update(phase_params)
      redirect_to @phase
    else
      render :edit
    end
  end

  def destroy
    @phase.destroy
    redirect_to lead_phases_path(@phase.lead)
  end

  private

  def phase_params
    params.require(:phase).permit(:phase_type, :start_date, :end_date, :user_id, :approved)
  end

  def find_phase
    @phase = Phase.find(params[:id])
  end

  def find_lead
    @lead = Lead.find(params[:lead_id])
  end
end
