class StaticPagesController < ApplicationController
	

  def home
	@user = current_user
  	@post = current_user.posts.build if signed_in?
  	# @feed_items = current_user.feed
  	@posts = Post.all
  	@comment = Comment.new
  	@comments = Comment.all
  	@feed = Post.feed(@user) if signed_in? 

  end
end
