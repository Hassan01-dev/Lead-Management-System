# frozen_string_literal: true

class ProjectsController < ApplicationController
  layout 'dashboard'
  def index
    @projects = Project.all
    authorize @projects
  end

  def new
    @lead = Lead.find(params[:lead_id])
    @project = Project.new(project_name: @lead.lead_name, lead_id: @lead.id)
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    if @project.save
      @lead = @project.lead
      if @lead.toggle!(:is_sale) # rubocop:disable Rails/SkipsModelValidations
        LeadMailer.with(lead: @lead, admin: current_user).lead_status.deliver_later
        flash[:notice] = 'Lead Status Changed Successfully.'
      end
      redirect_to projects_path
    else
      render 'new'
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name, :user_id, :lead_id)
  end
end
