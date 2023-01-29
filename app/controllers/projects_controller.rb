class ProjectsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index 
		projects = Project.order('id DESC')
		render json: projects
	end

	def create
		project = Project.new(project_params.merge({user_id: 1}))
		
	  if project.save
	    render json: project, status: :created
	  else
	    render json: project.errors, status: :unprocessable_entity
	  end
	end

	def update
	  project = Project.find(params[:id])
	  if project.update(project_params)
	    render json: project
	  else
	    render json: project.errors, status: :unprocessable_entity
	  end
	end

	def destroy
		contour = Project.find(params[:id])
	  contour.destroy
	  render json: { success: true }
	end

	def rooms
		project = Project.find(params[:id])
		render json: {
			project: project,
			rooms: project.rooms.order('id DESC')
		}
	end

	private

	def project_params
	  params.require(:project).permit(:title)
	end

end
