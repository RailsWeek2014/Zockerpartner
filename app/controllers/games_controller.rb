class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    @game_users = GameUser.where("user_id = ?", current_user.id)
  end

  def add_game
    @game_users = GameUser.where(user_id: current_user.id, game_id: params[:id]).first
    unless @game_users.nil?
      @game_users.update_column :deleted, false
      redirect_to games_path
    else
      @game = GameUser.new
      @game.user_id = current_user.id
      @game.game_id = params[:id]
      @game.deleted = 'false'
      #respond_to do |format|
        if @game.save
          #format.html { redirect_to game_users_path, notice: 'Game user was successfully created.' }
          #format.json { render :show, status: :created, location: game_users_path }
          redirect_to games_path
        else
          #format.html { render :new }
          #format.json { render json: game_users_path.errors, status: :unprocessable_entity }
        end
      #end 
    end
  end


  # GET /games/1
  # GET /games/1.json
  def show
    @game_users = GameUser.all
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :icon, :description)

    end
end
