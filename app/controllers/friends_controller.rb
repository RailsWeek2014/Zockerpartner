class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = current_user.friends
  end

  def destroy
    @friend = User.find(params[:id])
    current_user.friends.delete @friend
    @friend.friends.delete current_user if @friend.friends.include? current_user
    redirect_to friends_path
  end
end
