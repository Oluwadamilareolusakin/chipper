class UsersController < ApplicationController
    include UsersHelper

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.build(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user = User.find(params[:id])    
        @user.destroy
        flash.notice = 'User was destroyed successfully'
        redirect_to users_path
    end
end
