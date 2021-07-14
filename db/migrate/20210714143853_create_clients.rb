class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :secret
      t.integer :access_token_expire_time
      t.integer :refresh_token_short_expire_time
      t.integer :refresh_token_long_expire_time
      t.integer :other_token_expire_time

      t.timestamps
    end
  end
end
