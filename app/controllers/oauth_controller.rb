require "#{Rails.root}/lib/api_errors/resource_exists"

class OauthController < ApplicationController
  def register
    user_data = user_params

    email = user_data[:email]

    raise ApiErrors::ResourceExists.new("User with email '#{email}' already exists", 'email') if User.find_by email: email

    user = User.create! user_data

    render json: user
  end

  def login
    # TODO
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
    params.require('user').permit(:email, :password, :client_id)
  end
end
