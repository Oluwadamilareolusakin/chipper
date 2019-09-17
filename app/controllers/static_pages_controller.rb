class StaticPagesController < ApplicationController
  before_action :logged_in_user?, only: [:timeline]

  def timeline
    @user = current_user
    @post = current_user.posts.build if logged_in?
    @posts = current_user.posts
  end


  def landing_page
    if current_user
        @user = current_user
        @posts = current_user.posts 
        render 'timeline'
    else
        render 'landing_page'
    end
  end

end
