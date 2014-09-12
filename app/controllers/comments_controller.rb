class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # raty source: http://paweljaniak.co.za/2013/07/25/5-star-ratings-with-rails/
  # raty jquery source: http://wbotelhos.com/raty
  def view
    #:user ist auch eine id
    @current_user = User.find(params[:user])
    @game_rating_user = GameUser.find(params[:id])
    @comments = Comment.where("gameuser_id = ?", @game_rating_user.id)
    @logo = Game.find(@game_rating_user.game_id).icon

    @rating_entry = Rating.where(game_user_id: @game_rating_user.id, user_id: @current_user.id).first 
    unless 
      @rating_entry = Rating.create(game_user_id: @game_rating_user.id, user_id: @current_user.id, score: 0)
    end
    #@rating = Rating.find(@game_rating_user.rating_id).score
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    puts "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"
   # @text = params[:comment_text]
   # @game_user = params[:game_user]
   # @user_id = params[:user_id]

    ##puts @text
    #puts @game_user
    #puts @user_id
    puts "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"

    #@comment = Comment.new(:user_id => @user_id, :gameuser_id => @game_user, :comment_text => @text)
    @comment = Comment.new(comment_params) 


    respond_to do |format|
      if @comment.save
        format.html { redirect_to game_users_path, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment_text, :gameuser_id, :user_id)
    end
  
end
