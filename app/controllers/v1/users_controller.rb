class V1::UsersController < ApplicationController
  before_action :pundit_user, except: [:create]

  def show
    user = find_user
    return unless user

    render :user, locals: { user: user }, status: 200
  end

  def create
    user = User.new(user_params)
    if user.save
      token = JsonWebToken.encode({ id: user.id })
      render :create, locals: {user: user, token: token }, status: 201
    else
      process_error(user, 'Cannot create account')
    end
  end

  def update
    user = find_user
    return unless user

    authorize user
    if user.update(user_params)
      render :user, locals: {user: user }, status: 202
    else
      process_error(user, 'Cannot update account')
    end
  end

  def destroy
    user = find_user
    return unless user

    authorize user
    if user.destroy
      action_success('Account deleted', 202)
    else
      process_error(user, 'Something went wrong')
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :given_name,
      :last_name,
    )
  end

  def find_user
    user = User.find_by(id: params[:id])
    return user if user

    render json: { error: "Cannot find user" }
    nil
  end
end
