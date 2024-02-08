class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    if params["Contestant id"]
      ContestantProject.create(project_id: @project.id, contestant_id: params["Contestant id"])
    end
  end
end
