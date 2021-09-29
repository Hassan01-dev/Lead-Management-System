# frozen_string_literal: true

class LeadsController < ApplicationController
  layout 'dashboard'

  before_action :find_lead, only: %i[show edit update destroy] # rubocop:disable Rails/LexicallyScopedActionFilter

  def index
    @leads = Lead.where(is_sale: false).page(params[:page]).per(10)
  end

  def new
    @lead = Lead.new
    authorize @lead
  end

  def create
    @lead = Lead.new(lead_params)
    authorize @lead
    @lead.user = current_user
    if @lead.save
      LeadMailer.with(lead: @lead).lead_created.deliver_later
      flash[:success] = 'Lead Created Successfully.'
      redirect_to @lead
    else
      render 'new'
    end
  end

  def update
    if @lead.update(lead_params)
      LeadMailer.with(lead: @lead, admin: current_user).lead_update.deliver_later
      flash[:notice] = 'Lead Updated Successfully.'
      redirect_to @lead
    else
      render 'edit'
    end
  end

  def destroy
    @lead.destroy
    LeadMailer.with(lead: @lead, admin: current_user).lead_deleted.deliver_later
    flash[:alert] = 'Lead Deleted Successfully.'

    respond_to do |format|
      format.html { redirect_to leads_path }
      format.js
    end
  end

  def approve
    @lead = Lead.find(params[:lead_id])
    authorize @lead, :update?
    if check_lead
      redirect_to new_project_path(lead_id: @lead.id)
    else
      flash[:alert] = 'Some Phase for this Lead is not approved.'
      redirect_to leads_path
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:lead_name, :lead_type, :platform_used, :client_name, :client_address, :client_email,
                                 :client_contact)
  end

  def find_lead
    @lead = Lead.find(params[:id])
    authorize @lead
  end

  def check_lead
    @phases = @lead.phases
    @phases.each do |phase|
      next unless phase.approved == false

      return false
    end
    true
  end
end
