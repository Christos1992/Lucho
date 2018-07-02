class ParentsController < ApplicationController
skip_before_action :authenticate_parent!, only: [:new, :create]
before_action  :find_id, only:[:show, :edit, :update, :destroy]

  def dashboard
    parent_from_parent_id
  end

  def new
  	@parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    @parent.user = current_user
    if @parent.save
        redirect_to new_parent_child_path(@parent)
    else
        render "new"
    end

  end

  def show
  end

  def edit

  end

  def update
    @parent.update(parent_params)
    redirect_to parent_path(@parent)
  end

  def calendar

  end

private
  def parent_params
    params.require(:parent).permit(:first_name, :last_name, :date_of_birth, :working_status, :civil_status, :hobbies, :share_info, :gender, :user_id)
  end
  def parent_from_parent_id
     @parent = Parent.find(params[:parent_id])
  end
  def find_id
     @parent = Parent.find(params[:id])
  end

end


