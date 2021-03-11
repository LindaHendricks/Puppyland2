class ApplicationController < ActionController::Base
    helper_method :current_renter
    helper_method :logged_in?
    helper_method :authorized
    

        def current_renter
            Renter.find_by(id: session[:renter_id])
        end

        def logged_in?
            !current_renter.nil?
        end
    end