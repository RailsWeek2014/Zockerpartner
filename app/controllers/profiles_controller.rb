class ProfilesController < ApplicationController
	def index
		@users = User.all
		@game_users = GameUser.all
	end

	def show
	    @profile = User.find(params[:id])
	    @game_users = GameUser.all
	end

	def destroy
		@profile = User.where("id = ?", params[:id]).first
		@profile.destroy
		redirect_to game_users_path
	end

end
