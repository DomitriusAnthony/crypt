class Post < ApplicationRecord
	scope :by_date, -> { order(created_at: :desc) }
	belongs_to :user
	validates :user_id, presence: :true
	has_many :comments, as: :commentable

	def self.feed(user)
    	Post.where("user_id IN (?) OR user_id = ?").order("id DESC")
  	end

end
