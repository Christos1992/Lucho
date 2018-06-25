class IncidentsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def intex
    @incidents = Incident.all
  end

  def new
    @incident = Incident.new
    @parent = current_user.parent
    @allmedications = current_user.parent.child.child_medications

  end

  def create
    @incident = Incident.new(incident_params)
    @incident.parent = Parent.find(current_user.parent.id)
    if @incident.save
      redirect_to incident_path(@incident)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @incident.update(incidents_params)
    redirect_to incident_path(@incident)
  end

  def destroy
    @incident.destroy
    redirect_to incidents_path
  end

  private
  def incident_params
   params.require(:conversation).permit(:medication_name, :dose, :period,:side_effect, :description, :metric, :date_medication_recreived, :date_of_incident)
  end

  def find_id
   @incident = Incident.find(params[:id])

  end
end
