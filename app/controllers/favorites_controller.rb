class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(trip_id: params[:trip_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @favorite = current_user.favorites.find_by(trip_id: @trip.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
