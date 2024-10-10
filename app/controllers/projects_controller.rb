class ProjectsController < ApplicationController
  def show
    @notifications = Notification.all
    ## TODO: should be scoped to project in future.
  end

  def edit
  end

  def update
    if @project.update(safe_params)
      flash[:success] = "Project updated!"
      redirect_to root_url
    else
      flash.now[:error] = "Error updating project!"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def safe_params
    params.require(:project).permit(:name, :status)
  end
end
