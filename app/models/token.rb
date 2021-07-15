class Token < ApplicationRecord
  belongs_to :client
  belongs_to :user

  def self.create_new_token(user_id, client_id, secret, access_token_expire_time, refresh_token_expire_time)
    time_now = Time.now.to_i
    access_token_expire_at = time_now + access_token_expire_time
    refresh_token_expire_at = time_now + refresh_token_expire_time

    access_token = JWT.encode({ user_id: user_id, exp: access_token_expire_at }, secret, 'HS256')
    refresh_token = JWT.encode({ user_id: user_id, exp: refresh_token_expire_time, type: :refresh }, secret, 'HS256')

    token_payload = {
      access_token: access_token,
      refresh_token: refresh_token,
      access_token_expire_at: Time.at(access_token_expire_at),
      refresh_token_expire_at: Time.at(refresh_token_expire_at),
      user_id: user_id,
      client_id: client_id
    }

    Token.create!(token_payload)
  end
end
