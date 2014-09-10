class Game < ActiveRecord::Base
	has_many :GameUsers
	has_many :Users, through: :GameUsers
	
end
