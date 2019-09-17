class SessionsController < ApplicationController

  def new
    redirect_to current_user if logged_in?
  end

  def create
    string = params[:session][:username_or_email]
    user = find_by_email_or_username(string)
    if user && user.authenticate(params[:session][:password])
      login(user)
      remember(user)
      flash[:success] = "Welcome, #{user.name}"
      redirect_back_or_to root_url
    else
      flash[:danger] = 'Invalid password or email'
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
  end
end
