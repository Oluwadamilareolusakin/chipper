module AdministratorsHelper
    # Never trust parameters from the scary internet, only allow the white list through.
    def administrator_params
        params.require(:administrator).permit(:email, :username, :password, :name)
    end
end
