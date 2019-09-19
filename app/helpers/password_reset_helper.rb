module PasswordResetHelper
    def password_reset_params
        params.require(:user).permit(:password)
    end

    def valid_user?
        unless @user && @user.authenticated?(:reset, params[:id])
            flash[:danger] = "Invalid password reset link"
            redirect_to root_path
        end
    end

    def check_expiration
        if @user.password_reset_expired?
            flash[:danger] = "Password reset link has expired"
            redirect to new_password_reset_path
        end
    end

    def get_user
        @user = User.find_by(email: params[:email])
    end
end
