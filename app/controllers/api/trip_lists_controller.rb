class Api::TripsController < Api::BaseController
  before_action :set_trip, except: [:index, :create]

  def index
    @trips = current_user.trips
    render json: @trips, status: :ok
  end

  def show
    render json: @trip, status: :ok
  end

  def create
    @trip = current_user.trips.new(trip_params)
    if @trip.save
      render json: @trip, status: :created
    else
      render json: {errors: @trip.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    if @trip.update(trip_params)
      render json: @trip, status: :ok
    else
      render json: {errors: @trip.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @trip.destroy
    head :no_content
  end

  private

    def set_trip
      @trip = current_user.trips.find(params[:id])
    end
    
    def trip_params
      params.require(:trip).permit(:title,
                                   :destination,
                                   :departure_date,
                                   :return_date)
    end
end
