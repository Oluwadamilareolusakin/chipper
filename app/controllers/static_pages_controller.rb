class StaticPagesController < ApplicationController
  before_action :logged_in_user?, only: [:timeline]

  def timeline
    @user = current_user
    @post = Post.new
    @posts = current_user.feed
  end


  def landing_page
    if current_user
        @user = current_user
        @posts = current_user.feed
        render 'timeline'
    else
        render 'landing_page'
    end
  end

end
