# frozen_string_literal: true

class LeadsController < ApplicationController
  layout 'dashboard'

  before_action :find_lead, only: %i[show edit update destroy]

  def index
    @leads = Lead.all
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    @client = Client.new(client_params)
    if @client.save
      @lead.user = current_user
      @lead.is_sale = false
      @lead.client = @client
      if @lead.save
        redirect_to @lead
      else
        render new
      end
    else
      render new
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
    params.require(:lead).permit(:lead_name, :lead_type, :platform_used)
  end

  def client_params
    params.require(:lead).permit(:client_name, :client_address, :client_email, :client_contact)
  end

  def find_lead
    @lead = Lead.find(params[:id])
  end
end
