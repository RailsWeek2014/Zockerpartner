class ProfilesController < ApplicationController
	def index
		@users = User.all
		@game_users = GameUser.all
	end

	def show
	    @profile = User.find(params[:id])
	    @game_users = GameUser.all
	end

end
