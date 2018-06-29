class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!

  before_action :authenticate_parent!
  skip_before_action :authenticate_parent! , if: :devise_controller?
  def authenticate_parent!

    redirect_to new_parent_path if !current_user.nil? && current_user.parent.nil?

  end
end
