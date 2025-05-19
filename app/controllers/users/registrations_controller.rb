class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

    def respond_with(resource, _opts = {})
      if resource.persisted?
        render json: {message: 'User registered successfully', user: resource}, status: :ok
      else
        render json: {message: resource.errors.full_messages}, status: :unprocessable_entity
      end
    end
end