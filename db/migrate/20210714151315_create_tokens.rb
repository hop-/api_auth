class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens, force: true do |t|
      t.string :access_token
      t.timestamp :access_token_expire_at
      t.string :refresh_token
      t.timestamp :refresh_token_expire_at
      t.references :client, null: false, foreign_key: { to_table: :clients }
      t.references :user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
