class RatingsController < ApplicationController
	# raty source: http://paweljaniak.co.za/2013/07/25/5-star-ratings-with-rails/
	def update
		#@game_rating_user = GameUser.find(params[:id])
	    #@rating = Rating.find(@game_rating_user.rating_id).score
	    @rating = Rating.find(params[:id])
	    @game_user = @rating.game_user
	    puts "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
	    #@rating_entry = Rating.find(@game_rating_user.rating_id)
	    #Unsicher ob das geht:
	    	#@x = @game_rating_user.amount +1

	    if @rating.update_attributes(score: params[:score])
	    	
	    	#@game.update(amount: x)
	      respond_to do |format|
	        format.js
	      end
	    end
		
	end


end
