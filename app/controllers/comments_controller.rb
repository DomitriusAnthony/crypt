class CommentsController < ApplicationController
	before_action :find_commentable

	def new
		@comment = Comment.new
	end

	def create
		@comment = @commmentable.comments.new comment_params

		if @comment.save
			redirect_to :back, notice: "Comment successfully posted!"
		else
			redirect_to :back, notice: "Error posting your comment!"
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

	def find_commentable
		@commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
		@commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
	end
end
