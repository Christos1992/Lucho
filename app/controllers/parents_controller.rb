class ParentsController < ApplicationController
before_action  :find_id, only:[:show, :edit, :update, :destroy]

def dashboard
end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new[parent_params]
    @parent.user_id = current_user.id
    if @parent.save
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
    @parent.update[parents_params]
    redirect_to pages_path
  end

  def delete
    @parant.destroy
    redirect_to pages_path
  end

private

  def parents_params
    params.require(:parent).permit(:first_name, :last_name, :date_of_birth, :working_status, :civil_status, :hobbies, :share_info)
  end

  def find_id
     @parent = Parent.find(params[:id])
  end


end

