class BreweriesController < ApplicationController
    def index
        @breweries = Brewery.all
        render json: @breweries
    end
end
