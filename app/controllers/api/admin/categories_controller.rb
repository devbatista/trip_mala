class Api::Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_category
  
  def index
    render json: Category.all, status: :ok
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: category, status: :created
    else
      render json: {errors: category.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    if @categoy.update(category_params)
      render json: @category, status: :ok
    else
      render json: {errors: category.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private

    def authorize_admin!
      render json: {error: 'Not authorized'}, status: :forbidden unless current_user.admin?
    end

    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
