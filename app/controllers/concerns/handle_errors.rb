module HandleErrors
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotUnique, with: :conflict_response
    rescue_from ActionController::ParameterMissing, with: :bad_request_response
  end

  private

    def not_found_response(exception)
      render json: {error: 'Record not found', details: exception.message}, status: :not_found
    end

    def unprocessable_entity_response(exception)
      render json: {error: 'Invalid data', details: exception.record.errors.full_messages}, status: :unprocessable_entity
    end

    def conflict_response(exception)
      render json: {error: 'Data conflict', details: ['Duplicated record']}, status: :conflict
    end

    def bad_request_response(exception)
      render json: {error: 'Invalid parameters', details: exception.message}, status: :bad_request
    end
end
