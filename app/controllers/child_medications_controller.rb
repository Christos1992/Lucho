class ChildMedicationsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

def intex
    @childmedications = Childmedication.all
  end

  def new
    @childmedication = ChildMedication.new
    @child = current_user.parent.child

  end

  def create
    @childmedication = ChildMedication.new(childmedication_params)
    @childmedication.parent = Parent.find(current_user.parent.id)
      if @childmedication.save
      redirect_to childmedication_path(@childmedication)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @childmedication.update(childmedications_params)
    redirect_to childmedication_path(@childmedication)
  end

  def destroy
    @childmedication = ChildmMdication.find(params[:id])
    @childmedication.destroy
    redirect_to childmedications_path
  end

  private
  def ChildMedication_params
   params.require(:conversation).permit(:perscriptioned_doses,:active, :days_for_useage)
  end

  def find_id
   @ChildMedication = ChildMedication.find(params[:id])

  end
end
