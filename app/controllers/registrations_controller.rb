class RegistrationsController < ApplicationController
  skip_before_action :authenticate_request

  def create
    command = CreateUser.call(params[:name], params[:email], params[:password], params[:role])
    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
