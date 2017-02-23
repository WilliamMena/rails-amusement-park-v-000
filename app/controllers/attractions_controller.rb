class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def update
    attraction = Attraction.find(params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def ride
    @attraction = Attraction.find(params[:id])
    if current_user.height < @attraction.min_height && current_user.tickets < @attraction.tickets
      flash.alert = ["You are not tall enough to ride the #{@attraction.name}"]
      flash.alert << "You do not have enough tickets to ride the #{@attraction.name}"
    elsif current_user.height < @attraction.min_height
      flash.alert = "You are not tall enough to ride the #{@attraction.name}"
    elsif current_user.tickets < @attraction.tickets
      flash.alert = "You do not have enough tickets to ride the #{@attraction.name}"
    else
      #can def refactor this afterwards
      current_user.tickets = current_user.tickets-@attraction.tickets
      current_user.nausea = current_user.nausea+@attraction.nausea_rating
      current_user.happiness = current_user.happiness-@attraction.happiness_rating 
      current_user.save
      flash.notice = "Thanks for riding the #{@attraction.name}!"
    end
    redirect_to user_path(current_user)
  end




private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end


