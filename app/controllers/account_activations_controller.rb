class AccountActivationsController < ApplicationController
    include AccountActivationsHelper

    def edit
        @@user = @user.find_by( email: params[:email] )
        # attempt_to_activate(@@user, params[:id])
        if @user.activated
            flash[:success] = "Your account has already been activated!"
            redirect_to timeline_path
        elsif @user && @user.authenticated?(params[:id],:activation)
            activate @user
            login(@user)
            flash[:success] = "Your account has been activated successfully!"
            redirect_to timeline_path
        else
            flash[:danger] = "Invalid Activation Link!"
            redirect_to root_path
        end 
    end
end
