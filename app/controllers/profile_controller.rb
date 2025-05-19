class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: {
      message: "Welcome, #{current_user.email}",
      user: current_user
    }, status: :ok
  end
end