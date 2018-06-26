class SideEffectIncidentsController < ApplicationController

  def create

    @incident = Incident.find(params[:incident_id])
    @side_effect_incident = SideEffectIncident.new(side_effect_incident_params)
    @side_effect_incident.incident = @incident
   if @side_effect_incident.save
     @allsideeffects = SideEffect.all

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

  private

  def side_effect_incident_params
    params.require(:side_effect_incident).permit(:incident_id, :side_effect_id)
  end

end
