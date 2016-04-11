class FoodController < ApplicationController

  def index
	end

  def search
    @diet = params[:diet]
    # @location = params[:location]
    render json: Yelp.client.search('Berkeley', {term: @diet})
  end

end