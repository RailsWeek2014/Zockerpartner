class ProfilesController < ApplicationController
	def index
		@users = User.all
		@game_users = GameUser.all
	end

end
