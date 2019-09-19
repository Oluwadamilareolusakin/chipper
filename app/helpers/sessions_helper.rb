module SessionsHelper
    def find_by_email_or_username(string)
        if string.include?('@')
            @user = User.find_by(email: string)
        else
            @user = User.find_by(username: string)
        end
    end


    def login(user)
        session[:user_id] = user.id
        flash[:notice] = "Please activate your account or you may lose it if you forget the password"
    end

    def redirect_back_or_to(default)
        redirect_to (session[:fowarding_url] || default)
        session.delete(:fowarding_url)
    end

    def store_url
        session[:fowarding_url] = request.get? || request.post? ? request.original_url : nil
    end

    def current_user
        if(user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif(user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(:remember, cookies[:remember_token])
                login(user)
                @current_user = user
            end
        end
    end

    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def logged_in?
        !current_user.nil?
    end

    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    def logout
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
        flash[:success] = 'You logged out successfully'
        redirect_to root_path
    end

    def current_user?(user)
        user == current_user
    end

    def logged_in_user?
        unless logged_in?
            store_url
            flash[:danger] = 'Please login'
            redirect_to login_path
        end
    end

    def correct_user?
        @user = User.find(params[:id])
        redirect_to root_path unless current_user?(@user) || current_user.is_admin
    end

    def is_admin?
        unless current_user.is_admin
            flash[:danger] = "You don't have permission to access this page"
            redirect_to root_path
        end
    end
end
