class Api::TripListsController < Api::BaseController
  before_action :set_trip_list, except: [:index, :create]

  def index
    @trip_lists = current_user.trip_lists
    render json: @trip_lists, status: :ok
  end

  def show
    render json: @trip_list, status: :ok
  end

  def create
    @trip_list = current_user.trip_lists.new(trip_list_params)
    if @trip_list.save
      render json: @trip_list, status: :created
    else
      render json: {errors: @trip_list.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    if @trip_list.update(trip_list_params)
      render json: @trip_list, status: :ok
    else
      render json: {errors: @trip_list.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @trip_list.destroy
    head.no_content
  end

  private

    def trip_list
      @trip_list = current_user.trip_lists.find(params[:id])
    end
    
    def trip_list_params
      params.require(:trip_list).permit(:title,
                                        :destination,
                                        :departure_date,
                                        :return_date)
    end
end
