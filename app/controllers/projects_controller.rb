# frozen_string_literal: true

class ProjectsController < ApplicationController
  layout 'dashboard'
  def index
    @projects = Project.all
    authorize @projects
  end

  def new
    @lead = Lead.find(params[:format])
    @project = Project.new(project_name: @lead.lead_name, lead_id: @lead.id)
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    if @project.save
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
