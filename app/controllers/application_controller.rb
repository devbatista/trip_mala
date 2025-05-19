class ApplicationController < ActionController::API
  respond_to :json

  include HandleErrors
end
