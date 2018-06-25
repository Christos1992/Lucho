class ChildsController < ApplicationController

before_action  :find_id, [:show, :edit, :update, :destroy]
  def new
    @child = Child.new 
  end

  def create 
    @child = Child.new[child_params]
    @child.parent = current_user.parent
    if @child.save
        redirect_to pages_path
    else
        render 'new'
    end
  end


  def show
  end
 
  def edit  
  end

  def update
    @child.update[childs_params]
    redirect_to pages_path
  end

  def delete
    @parant.destroy
    redirect_to pages_path
  end




end

private

  def childs_params
    params.require(:child).permit(:first_name, :last_name, :date_of_birth, :gender, :type_of_cancer, :stage_of_cancer, :first_time_patient, :date_treatment_begin, :hospital_name, :doctor_name, :school, :biggest_dream, :medications,)
  end

  def find_id
     @child = Child.find(params[:id])
  end

end
