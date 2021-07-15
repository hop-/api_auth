require "#{Rails.root}/lib/api_errors/resource_exists"
require "#{Rails.root}/lib/api_errors/authentication_error"

class OauthController < ApplicationController
  def register
    user_data = user_params

    email = user_data[:email]

    begin
      user = User.create! user_data
    rescue ActiveRecord::RecordNotUnique => exception
      raise ApiErrors::ResourceExists.new("User with email '#{email}' already exists", 'email')
    end

    render json: user
  end

  def login
    login_data = login_params

    user = User.find_by(
      email: login_data[:email],
      client_id: login_data[:client_id]
    )
    if user && user.authenticate(login_data[:password])
      client = Client.find(login_data[:client_id])
      token = Token.create_new_token(
        user.id,
        client.id,
        client.secret,
        client.access_token_expire_time,
        client.refresh_token_short_expire_time
      )

      render json: { user:user, access_token: token.access_token, refresh_token: token.refresh_token }
    else
      raise ApiErrors::AuthenticationError.new
    end
  end

  def login_with_google
    # TODO
  end

  def authenticate
    # TODO
  end

  def refresh_token
    # TODO
  end

  def regenerate_activation_token
    # TODO
  end

  def delete_token
    # TODO
  end

  def reset_password
    # TODO
  end

  def change_password
    # TODO
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :client_id)
  end

  private
  def login_params
    params.require(:user).permit(:email, :password, :client_id, :permissions, :context)
  end
end
