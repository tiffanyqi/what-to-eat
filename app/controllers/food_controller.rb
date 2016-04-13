class FoodController < ApplicationController

  def index
	end

  def search
    @diet = params[:diet]
    # @location = params[:location]
    data = Yelp.client.search('Berkeley', {term: @diet})
    generate_businesses(data)
    get_random_category
  end

  def generate_businesses(data)
    @businesses = Hash.new
    @categories = Hash.new
    data.businesses.each do |business|
      @businesses[business] = []
      @businesses[business].push(business.name)
      @businesses[business].push(business.url)
      @businesses[business].push(business.categories)
      @businesses[business].push(business.location)
      generate_categories(business)
    end
  end

  def generate_categories(business)
    business.categories.each do |category|
      @categories[category] = [] if !@categories.key?(category)
      @categories[category].push(business.name)
    end
  end

  def get_random_category
    random_number = rand(@categories.length)
    @random_category = @categories.keys[random_number]
  end

end