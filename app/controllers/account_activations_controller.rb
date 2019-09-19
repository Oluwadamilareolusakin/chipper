class AccountActivationsController < ApplicationController
    include AccountActivationsHelper

    def edit
        user = User.find_by( email: params[:email] )
        attempt_to_activate(user, params[:id]) 
    end
end
