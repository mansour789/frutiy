class ApplicationController < ActionController::Base
  # add permit to Devise table to add Two columns
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:location, :name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:location, :name])
    end

    # if some one log in redirect to products index or home index
    def after_sign_in_path_for(resource)
      products_path || home_path
    end

end
