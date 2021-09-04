# app/controllers/api/base_controller.rb
class Api::BaseController < ApplicationController

  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  # TODO: only rescuable errors
  rescue_from InsufficientFund, with: :error

  def not_found
    render json: {
      'errors': [
        {
          'status': '404',
          'title': 'Not Found'
        }
      ]
    }, status: 404
  end

  def error
    render json: {
      'errors': [
        {
          'status': '400',
          'title': 'InsufficientFund'
        }
      ]
    }, status: 400
  end

end
