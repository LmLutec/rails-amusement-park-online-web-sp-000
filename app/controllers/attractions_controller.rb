class AttractionsController < ApplicationController

    def new 
        @attraction = Attraction.new 
    end 

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end 

    def index
        @attractions = Attraction.all 
        @attraction = Attraction.new 
        @user = User.find_by(id: session[:user_id])
    end 

    def show 
        @attraction = Attraction.find_by(id: params[:id])
        @user = User.find_by(id: session[:user_id])
        @ride = Ride.new(attraction_id: @attraction.id, user_id: @user.id)
    end

    def edit 
        @attraction = Attraction.find_by(id: params[:id])
    end 

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end 


    private 

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end 


