class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  skip_before_action :require_no_authentication, only: [:create]

  def create
    begin
      user = User.new(sign_up_params)

      if user.save
        render json: {message: 'User created successfully'}
      else
        render json: {message: user.errors.full_messages}, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotUnique => e
      render json: { errors: ['Email already registered'] }, status: :conflict
    end
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