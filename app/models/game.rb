class Game < ActiveRecord::Base
	has_many :GameUsers
	has_many :Users, through: :GameUsers

	#http://railscasts.com/episodes/37-simple-search-form
	def self.search(search)
		if search
			where("name LIKE ?", "%#{search}%")
		end
	end

end
