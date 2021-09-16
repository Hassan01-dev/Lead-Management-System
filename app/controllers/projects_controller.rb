# frozen_string_literal: true

class ProjectsController < ApplicationController
  layout 'dashboard'
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name, :user_id)
  end
end
