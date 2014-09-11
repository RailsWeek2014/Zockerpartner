class GameUsersController < ApplicationController
  before_action :set_game_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /game_users
  # GET /game_users.json
  def index
    @users = User.all
    @game_users = GameUser.all
    @ratings = Rating.all
    @current_user = current_user
    @friends = current_user.friends
    @friendships = Friendship.all
  end

  def add_user

    @friend = Friendship.new
    @friend.user_id = current_user.id
    @friend.friend_id = params[:id]
    #respond_to do |format|
    if @friend.save
        #format.html { redirect_to game_users_path, notice: 'Game user was successfully created.' }
        #format.json { render :show, status: :created, location: game_users_path }
        redirect_to friends_path
      else
        #format.html { render :new }
        #format.json { render json: game_users_path.errors, status: :unprocessable_entity }
      end
    #end 

  end

  def delete
   @game_users = GameUser.where("user_id = ? AND game_id = ?", current_user.id, params[:format]).first
   @game_users.update_column :deleted, true
   redirect_to games_path
  end


  # GET /game_users/1
  # GET /game_users/1.json
  def show
  end

  # GET /game_users/new
  def new
    @game_user = GameUser.new
  end

  # GET /game_users/1/edit
  def edit
  end

  # POST /game_users
  # POST /game_users.json
  def create
    @game_user = GameUser.new(game_user_params)

    respond_to do |format|
      if @game_user.save
        format.html { redirect_to @game_user, notice: 'Game user was successfully created.' }
        format.json { render :show, status: :created, location: @game_user }
      else
        format.html { render :new }
        format.json { render json: @game_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_users/1
  # PATCH/PUT /game_users/1.json
  def update
    respond_to do |format|
      if @game_user.update(game_user_params)
        format.html { redirect_to @game_user, notice: 'Game user was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_user }
      else
        format.html { render :edit }
        format.json { render json: @game_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_users/1
  # DELETE /game_users/1.json
  def destroy
    @game_user.destroy
    respond_to do |format|
      format.html { redirect_to game_users_url, notice: 'Game user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_user
      @game_user = GameUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_user_params
      params[:game_user]
    end

    #def friendship_user_params
    #  params.require(:friendship).permit(:friend_id, :user_id)
    #end

  end
