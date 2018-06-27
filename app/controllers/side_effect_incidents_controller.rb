class SideEffectIncidentsController < ApplicationController

  def create

    @incident = Incident.find(params[:incident_id])
    @side_effect_incident = SideEffectIncident.new(side_effect_incident_params)
    @side_effect_incident.incident = @incident
   if @side_effect_incident.save
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
      respond_to do |format|
        format.html { redirect_to incident_path(@incident) } #NEED TO FIX THE PATH
        format.js  # <-- will render `app/views/side_effect_incidents/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'incidents/show' }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @side_effect_incident = SideEffectIncident.find(params[:id])
    @side_effect_incident.destroy
      respond_to do |format|
        format.js  # <-- idem
      end
  end


  private

  def side_effect_incident_params
    params.require(:side_effect_incident).permit(:side_effect_id)
  end

end
