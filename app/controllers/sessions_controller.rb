class SessionsController < ApplicationController

  def new
    redirect_to timeline_path if logged_in?
  end

  def create
    string = params[:session][:username_or_email]
    @user = find_by_email_or_username(string)
    if @user && @user.authenticate(params[:session][:password])
      login(@user)
      remember(@user) if params[:remember] == 1
      flash[:success] = "Welcome, #{@user.name}"
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
