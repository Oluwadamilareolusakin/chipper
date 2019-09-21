class SessionsController < ApplicationController

  def sign_in
    redirect_to timeline_path if logged_in?
    render 'new'
  end

  def create
    string = params[:session][:username_or_email]
    @user = find_by_email_or_username(string)
    if @user && @user.authenticate(params[:session][:password])
      login(@user)
      remember(@user)
      flash[:success] = "Welcome, #{@user.name}" if @user.activated
      redirect_back_or_to timeline_path
    else
      flash[:danger] = 'Invalid password or email'
      render 'new'
    end
  end

  def destroy
   if logged_in?
    logout 
   else
    redirect_to root_path 
   end
  end
end
