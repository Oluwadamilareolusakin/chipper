class PostsController < ApplicationController
    include PostsHelper

    def show
        @post = Post.find(params[:id])
    end
    
    def new
        logged_in_user? unless logged_in?
        @post = current_user.posts.build if logged_in?
    end

    def create
        @post = current_user.posts.build(post_params)
        if !current_user.activated
            flash[:alert] = "Please activate your account with the link in your email"  
            redirect_to timeline_path      
        elsif @post.save && current_user.activated        
            flash[:success] = 'You chipped in!'
            redirect_to timeline_path
        else
            redirect_to  'new'
        end
    end

    def destroy
        @post = Post.find_by(params[:id])
        @post.destroy
        flash[:success] = 'Your chip was deleted!'
        redirect_to timeline_path
    end
end
