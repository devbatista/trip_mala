class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

    def respond_with(resource, _opts = {})
      render json: {message: 'Login successful', user: resource}, status: :ok
    end

    def respond_to_destroy
      if current_user
        render json: {message: 'Logout successful'}, status: :ok
      else
        render json: {message: 'User not logged in'}, status: :unauthorized
      end
    end
end