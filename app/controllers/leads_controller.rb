# frozen_string_literal: true

class LeadsController < ApplicationController
  layout 'dashboard'

  def index
    @leads = Lead.all
  end

  def create
    @lead = Lead.new(lead_params)
    @user = current_user
    if @lead.save
      redirect_to @lead
    else
      render new
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:title, :text)
  end
end
