module PostsHelper
    def post_params
        params.require(:post).permit(:body, :user_id)
    end
end
