class AccountActivationsController < ApplicationController
    include AccountActivationsHelper

    def edit
        @user = User.find_by( email: params[:email] )
        attempt_to_activate(@user, :activation_token)
    end
end
