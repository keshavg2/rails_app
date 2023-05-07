class ApplicationController < ActionController::Base
  def validate_user_role!(role)
    redirect_to forbidden_path unless current_user != nil && current_user.has_role?(role)
  end
end
