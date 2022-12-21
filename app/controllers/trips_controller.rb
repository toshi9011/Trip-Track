class TripsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @trips = Trip.all
  end

  # GET /trips/1 or /trips/1.json
  def show
    @trip = Trip.find(params[:id])
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # POST /trips or /trips.json
  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    if @trip.save
      redirect_to trip_path(@trip), notice: "投稿しました。"
    else
      render :new
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
    if @trip.user != current_user
      redirect_to trips_path, alert: "不正なアクセスです。"
    end
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to trips_path(@trip), notice: "更新しました。"
    else
      render :edit
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    trip = Trip.find_by(id: params[:id])
    trip.destroy
    redirect_to trips_path, notice: "投稿を削除しました。"
  end

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:title, :body, :image)
    end
end
