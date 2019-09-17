class UsersController < ApplicationController
    include UsersHelper
    before_action :logged_in_user?, only: [:edit, :show]
    before_action :correct_user?, only: [:edit, :show]

    def index
        redirect_to root_path unless current_user && current_user.is_admin?
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end
    
    def new
        redirect_to current_user if logged_in?
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to Chipper #{@user.name}" 
            login(@user)
            redirect_to user_path(@user) 
        else
            render :new
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.save
            redirect_to @user
        else
            render 'edit'
        end
    end


    def destroy
        @user = User.find(params[:id])    
        @user.destroy
        flash.notice = 'User was destroyed successfully'
        redirect_to users_path
    end

    
end
