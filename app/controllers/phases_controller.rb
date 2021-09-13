# frozen_string_literal: true

class PhasesController < ApplicationController
  layout 'dashboard'

  def index
    find_lead
    @phases = @lead.phases
  end

  def new
    @phase = Phase.new
  end

  def create
    find_lead
    @phase = @lead.phases.build(phase_params)
    @phase.approved = false
    if @phase.save
      redirect_to @phase
    else
      render new
    end
  end

  def edit
    find_phase
  end

  def update
    find_phase
    if @phase.update(phase_params)
      redirect_to @phase
    else
      render :edit
    end
  end

  def destroy
    @lead = Phase.find(params[:id]).lead
    @phase = find_phase
    @phase.destroy
    redirect_to lead_phases_path(@lead)
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
