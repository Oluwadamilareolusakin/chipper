module AccountActivationsHelper
    def activate(user)
        user.activate_user
    end

    def attempt_to_activate(user, token)
        
    end
end
