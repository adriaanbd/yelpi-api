class V1::UsersController < ApplicationController
  before_action :pundit_user, except: [:create]

  def show
  end
  
  def create
    user = User.new(user_params)
    if user.save
      token = generate_token(user.id)
      render json: {user: user.attributes, token: token }
    else
      render json: { errors: user.errors, status: 422 }
    end
  end

  def update
    user = find_user
    return unless user

    authorize user
    if user.update(user_params)
      render json: {user: user.attributes, token: generate_token(user.id)}
    else
      render json: {error: "Cannot update account"}
    end
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

  def find_user
    user = User.find_by(id: params[:id])
    return user if user

    render json: { error: "Cannot find user" }
    nil
  end

  def generate_token(id)
    JsonWebToken.encode({id: id})
  end
end
