class Api::ChecklistItemsController < Api::BaseController
  before_action :set_trip_checklist
  before_action :set_checklist_item, only: [:update, :destroy]

  def index
    @checklist_items = @trip_checklist.checklist_items
    @checklist_items = @checklist_items.where(category_id: params[:category_id]) if params[:category_id].present?

    render json: @checklist_items, status: :ok
  end

  def create
    @checklist_items = @trip_checklist.checklist_items.new(checklist_item_params)
    if @checklist_items.save
      render json: @checklist_items, status: :created
    else
      render json: {errors: @checklist_items.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    binding.pry
    if @checklist_item.update(checklist_item_params)
      render json: @checklist_item, status: :ok
    else
      render json: {errors: @checklist_item.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @checklist_item.destroy
    head :no_content
  end

  def toggle_checked
    checklist_item = ChecklistItem.joins(:trip_checklist)
                                   .where(trip_checklists: {user_id: current_user.id})
                                   .find(params[:id])

    checklist_item.update(checked: !checklist_item.checked)

    render json: checklist_item, status: :ok
  end

  private

    def set_trip_checklist
      @trip_checklist = current_user.trip_checklists.find(params[:trip_checklist_id])
    end

    def set_checklist_item
      @checklist_item = @trip_checklist.checklist_items.find(params[:id])
    end
    
    def checklist_item_params
      params.require(:checklist_item).permit(:name, :checked)
    end
end