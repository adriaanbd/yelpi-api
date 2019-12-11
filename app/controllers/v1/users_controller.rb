class V1::UsersController < ApplicationController
  def show
  end
  
  def create
    user = User.new(user_params)
    if user.save
      token = JsonWebToken.encode({id: user.id})
      render json: {user: user.attributes, token: token }
    else
      render json: { errors: user.errors, status: 422 }
    end
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :given_name,
      :last_name,
      :profile_pic
    )
  end
end
