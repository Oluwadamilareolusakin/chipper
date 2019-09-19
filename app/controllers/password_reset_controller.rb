class PasswordResetController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:reset][:email])
    if @user
      @user.create_reset_token
      @user.send_password_reset_email
      flash[:success] = "Please check your email for password reset instructions"
      redirect_to login_path
    else
      flash.now[:warning] = "No Chipper Account associated with that email"
      render :new
    end
  end

  def edit
    user = User.find_by(email: params[:email])
    if !user || !user.authenticated?(:reset, params[:id])
      flash[:danger] = "Invalid password reset link"
      redirect_to root_path
    end
  end

  def update
    user = User.find(params[:id])
    user.update(password_reset_params)
  end
end
