class ParentsController < ApplicationController

before_action  :find_id, only:[:show, :edit, :update, :destroy]
  
  def dashboard
  end

  def new
    @parent = Parent.new
  end

def new
	@parents = Parent.new 
end

def show
   @parent = Parents[params]
end

def edit

end


end

private

  def parents_params
    params.require(:parent).permit(:first_name, :last_name, :date_of_birth, :working_status, :civil_status, :hobbies, :share_info, :user_id)
  end

  def find_id
     @parent = Parent.find(params[:id])
     authorize @parent
  end