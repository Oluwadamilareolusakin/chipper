class PostsController < ApplicationController
    include PostsHelper

    def show
        @post = Post.find(params[:id])
    end
    
    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)
        if !current_user.activated
            flash.now[:success] = "Please activate your account with the link in your email"        
            @post.destroy
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
