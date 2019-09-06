module AdministratorsHelper
    def administrator_params
        params.require(:administrator).permit(:username, :email, :password)
    end
end
