class Client < ApplicationRecord
  def self.get_client_id_by_secret(secret)
    client = self.find_by(secret: secret)

    client ? client.id : nil
  end
end
