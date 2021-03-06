module UsersHelper
    def user_params
        params.require(:user).permit(:name, :nationality, :age, :gender, :username, :password, :email)
    end

    def user_update_params
        params.require(:user).permit(:name, :nationality, :age, :gender, :username, :email)
    end

    def gravatar_for(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag( gravatar_url, alt: user.name, class: 'gravatar')
    end
end
