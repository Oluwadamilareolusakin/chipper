module UsersHelper
    def user_params
        params.require(:user).permit(:name, :nationality, :age, :gender, :username, :password, :email)
    end
end
