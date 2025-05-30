class Api::TripChecklistsController < Api::BaseController
  before_action :set_trip_checklist, except: [:create, :index]

  def index
    @trip_checklists = current_user.trip_checklists
    render json: @trip_checklists, status: :ok
  end

  def show
    render json: @trip_checklist, status: :ok
  end

  def create
    @trip_checklist = current_user
                      .trip_lists.find(params[:trip_list_id])
                      .trip_checklists.new(trip_checklist_params)

    if @trip_checklist.save
      render json: @trip_checklist, status: :created
    else
      render json: {errors: @trip_checklist.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    if @trip_checklist.update(trip_checklist_params)
      render json: @trip_checklist, status: :ok
    else
      render json: {errors: @trip_checklist.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @trip_checklist.destroy
    head :no_content
  end

  private

    def set_trip_checklist
      @trip_checklist = current_user
                        .trip_lists.find(params[:trip_list_id])
                        .trip_checklists.find(params[:id])
    end

    def trip_checklist_params
      params.require(:trip_checklist).permit(:title).merge!(user_id: current_user.id)
    end
end