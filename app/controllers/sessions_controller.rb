class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by( email: params[:session][:email].downcase )
    if user && user.authenticate(params[:session][:password])
      redirect_to users_path( user )
    else
      render 'new'
    end
  end

  def destroy
  
  end
end
