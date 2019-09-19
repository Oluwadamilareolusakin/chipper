class PasswordResetController < ApplicationController
  include PasswordResetHelper
  
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user?, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:reset][:email].downcase)
    if @user
      @user.create_reset_token
      @user.send_password_reset_email
      flash[:success] = "Please check your email for password reset instructions"
      redirect_to login_path
    elsif params[:reset][:email].empty?
      flash.now[:notice] = "Please fill out the email field"
      render :new
    else
      flash.now[:notice] = "No Chipper Account associated with that email"
      render :new
    end
  end

  def edit
    
  end

  def update
     if @user.update(password_reset_params)
      login @user
      flash[:success] = "Your password has been reset"
      redirect_to root_path
     elsif params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
     else
      render 'edit'
     end
  end
end
