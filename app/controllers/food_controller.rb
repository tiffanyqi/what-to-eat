class FoodController < ApplicationController

  def index
	end

  def search
    @diet = params[:diet]
    # @location = params[:location]
    data = Yelp.client.search('Berkeley', {term: @diet})
    @businesses = Hash.new
    data.businesses.each do |business|
      @businesses[business] = []
      @businesses[business].push(business.name)
      @businesses[business].push(business.url)
      @businesses[business].push(business.categories)
      @businesses[business].push(business.location)
    end
  end

end