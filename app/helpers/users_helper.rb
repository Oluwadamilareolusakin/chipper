module UsersHelper
    def user_params
        params.require(:user).permit(:name, :nationality, :age, :gender, :username, :password, :email)
    end

    def gravatar_for(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag( gravatar_url, alt: user.name, class: 'gravatar')
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
    
end
