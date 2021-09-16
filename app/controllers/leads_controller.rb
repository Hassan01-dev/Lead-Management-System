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
    if @lead.save
      redirect_to @lead
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @lead.update(lead_params)
      redirect_to @lead
    else
      render :edit
    end
  end

  def destroy
    @lead.destroy
    redirect_to leads_path
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
