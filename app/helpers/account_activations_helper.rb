module AccountActivationsHelper
    def activate(user)
        user.activate_user
    end

    def attempt_to_activate(user, token)
        if user.activated
            flash[:success] = "Your account has already been activated!"
            redirect_to timeline_path
        elsif user && user.authenticated?(token,:activation)
            activate user
            login(user)
            flash[:success] = "Your account has been activated successfully!"
            redirect_to timeline_path
        else
            flash[:danger] = "Invalid Activation Link!"
            redirect_to root_path
        end 
    end
end
