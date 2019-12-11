class V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user &.valid_password?(params[:password])
      token = JsonWebToken.encode({id: user.id})
      render json: {user: user.attributes, token: token}, status: 201
    else
      render json: { error: "Invalid credentials"}, status: 401
    end
  end
end
