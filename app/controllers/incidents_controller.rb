class IncidentsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @parent = current_user.parent

    if params[:query].present?
       @incidents = @parent.incidents.search_by_medicaiton(params[:query])
       if @incidents.empty?
        @incidents = Incident.all
      end
    else
      @incidents = Incident.all
    end
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
      if !@side_effect_names.include? "#{sideeffect.name}"
        @side_effect_names << sideeffect
      end
    end
    @side_effect_names = @side_effect_names.uniq { |p| p.name }
    @allmedications = current_user.parent.child.child_medications
    @names =[]
    @allmedications.each do |medication|
      @names << medication.medication.name
    end
  end

  def edit
     @side_effect_incident = SideEffectIncident.new
    @parent = current_user.parent
    @allsideeffects = SideEffect.all

    @side_effect_names = []
    @allsideeffects.each do |sideeffect|
      if !@side_effect_names.include? "#{sideeffect.name}"
        @side_effect_names << sideeffect
      end
    end
    @side_effect_names = @side_effect_names.uniq { |p| p.name }
    @allmedications = current_user.parent.child.child_medications
    @names =[]
    @allmedications.each do |medication|
      @names << medication.medication.name
    end
  end

  def update
    @incident.update(incidents_params)
    redirect_to incident_path(@incident)
  end

  def destroy
    @incident.destroy
    redirect_to parent_incidents_path(current_user.parent)
  end

  def events
    @incidents = []
    current_user.parent.incidents.each do |inc|

      # title =
      # @incidents << { title: inc.created_at,
      #   start: inc.created_at,
      #   end: inc.created_at,
      #   color: 'blue'
      #   }
        inc.side_effects.each do |se|
         @incidents << {
           title: inc.medication_name ,
           description: se.name + ": " + se.metric,
           start: inc.date_of_incident,
        end: inc.date_of_incident

         }
      end
    end

    render json: @incidents
  end


  private
  def incident_params
   params.require(:incident).permit(:medication_name, :dose, :period,:side_effect, :description, :metric, :date_medication_recreived, :date_of_incident)
  end

  def find_id
   @incident = Incident.find(params[:id])

  end
end
