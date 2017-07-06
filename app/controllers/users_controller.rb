class UsersController < ApplicationController
	def feed
		Post.where('user_id = ?', id)
	end

	def profile
		
	end

end
