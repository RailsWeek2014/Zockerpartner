class GameUser < ActiveRecord::Base
	belongs_to :game
	belongs_to :user
	has_many :comments
	has_many :users, through: :comments
	has_many  :ratings

	# raty source: http://paweljaniak.co.za/2013/07/25/5-star-ratings-with-rails/
	def average_rating
		ratings.sum(:score) / ratings.size
	end

end
