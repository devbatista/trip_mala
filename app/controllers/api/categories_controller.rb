class Api::CategoriesController < Api::BaseController
  def index
    @categories = Category.all
  end
end
