module PasswordResetHelper
    def password_reset_params
        params.require(:user).permit(:password)
    end
end
