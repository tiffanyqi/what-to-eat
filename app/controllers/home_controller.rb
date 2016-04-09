class HomeController < ApplicationController

	def index
        render json: Yelp.client.search('San Francisco')
	end

end