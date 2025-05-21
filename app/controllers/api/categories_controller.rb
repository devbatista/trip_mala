class Api::CategoriesController < Api::BaseController
  def index
    render json: Category.all, status: :ok
  end
end
