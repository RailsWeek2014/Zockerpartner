class Comment < ActiveRecord::Base
	belongs_to :game_user
	belongs_to :user
end
