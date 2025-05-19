class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  skip_before_action :require_no_authentication, only: [:create]

  def create
    user = User.create!(sign_up_params)
    render json: {message: 'User created successfully', user: user}, status: :created
  end

  protected

    def after_sign_up_path_for(resource)
      nil
    end

    def after_inactive_sign_up_path_for(resource)
      nil
    end

  private

    def respond_with(resource, _opts = {})
      if resource.persisted?
        render json: {message: 'User registered successfully', user: resource}, status: :ok
      else
        render json: {message: resource.errors.full_messages}, status: :unprocessable_entity
      end
    end
end