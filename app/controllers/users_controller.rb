class UsersController < ApplicationController
    include UsersHelper
    before_action :logged_in_user?, only: [:edit, :show, :index]
    before_action :correct_user?, only: [:edit, :show]
    before_action :is_admin?, only: [:index]

    def index
        @users = User.paginate(params[:page])
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
            @user.send_activation_email
            flash[:info] = "Welcome to Chipper #{@user.name} please activate your account!" 
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
        if @user.authenticate(params[:user][:password])
            @user.update(user_update_params)
            flash[:success] = "Your profile updated successfully!"
            redirect_to @user
        elsif params[:user][:password].empty?
            flash[:notice] = "You need to enter your password to save changes"
            render 'edit'
        else
            flash[:notice] = "Your password is incorrect"
            render 'edit'
        end
    end


    def destroy
        @user = User.find(params[:id])    
        @user.destroy
        flash[:success] = 'Your profile was deleted successfully'
        redirect_to root_path
    end

    
end
