class PostsController < ApplicationController
    include PostsHelper

    def show
        @post = Post.find(params[:id])
    end
    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:success] = 'You chipped in!'
            redirect_to timeline_path        
        else
            render 'new'
        end
    end

    def destroy
        @post = Post.find_by(params[:id])
        @post.destroy
        flash[:success] = 'Your chip was deleted!'
        redirect_to timeline_path
    end
end