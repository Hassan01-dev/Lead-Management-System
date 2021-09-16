# frozen_string_literal: true

class LeadsController < ApplicationController
  layout 'dashboard'

  before_action :find_lead, only: %i[show edit update destroy]

  def index
    @leads = Lead.order(:platform_used).page(params[:page]).per(10)
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    @lead.user = current_user
    @lead.is_sale = false
    if @lead.save
      LeadMailer.with(lead: @lead).lead_created.deliver_later
      redirect_to @lead
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @lead.update(lead_params)
      LeadMailer.with(lead: @lead, admin: current_user).lead_update.deliver_later
      redirect_to @lead
    else
      render 'edit'
    end
  end

  def destroy
    @lead.destroy
    LeadMailer.with(lead: @lead, admin: current_user).lead_deleted.deliver_later
    redirect_to leads_path
  end

  def approve
    @lead = Lead.find(params[:lead_id])
    if @lead.toggle!(:is_sale) # rubocop:disable Rails/SkipsModelValidations
      LeadMailer.with(lead: @lead, admin: current_user).lead_status.deliver_later
      redirect_to new_project_path
    else
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
  end
end
