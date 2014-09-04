class GameUser < ActiveRecord::Base
	belongs_to :Game
	belongs_to :User
end
