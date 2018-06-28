class IncidentsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @incidents = Incident.all
  end

  def new

    @side_effect_incident = SideEffectIncident.new
    @incident = Incident.new
    @parent = current_user.parent
    @allsideeffects = SideEffect.all

    @side_effect_names = []
    @allsideeffects.each do |sideeffect|
      @side_effect_names << sideeffect.name
    end

    @allmedications = current_user.parent.child.child_medications
    @names =[]
    @allmedications.each do |medication|
      @names << medication.medication.name
    end
  end

  def create
    @incident = Incident.new(incident_params)
    @incident.parent = Parent.find(current_user.parent.id)
    if @incident.save
      redirect_to parent_incident_path(current_user.parent,@incident)
    else
      render 'new'
    end
  end

  def show
    @side_effect_incident = SideEffectIncident.new
    @parent = current_user.parent
    @allsideeffects = SideEffect.all

    @side_effect_names = []
    @allsideeffects.each do |sideeffect|
      @side_effect_names << sideeffect.name
    end

    @allmedications = current_user.parent.child.child_medications
    @names =[]
    @allmedications.each do |medication|
      @names << medication.medication.name
    end
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
   params.require(:incident).permit(:medication_name, :dose, :period,:side_effect, :description, :metric, :date_medication_recreived, :date_of_incident)
  end

  def find_id
   @incident = Incident.find(params[:id])

  end
end
