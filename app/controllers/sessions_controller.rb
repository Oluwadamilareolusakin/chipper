class SessionsController < ApplicationController

  def new
    redirect_to current_user if logged_in?
    @user = User.new
  end

  def create
    user = User.find_by( email: params[:session][:email].downcase )
    if user && user.authenticate(params[:session][:password])
      login(user)
      flash[:success] = "Welcome, #{user.name}"
      redirect_to user
    else
      flash[:danger] = 'Invalid password or email'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
