class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, force: true do |t|
      t.string :email
      t.references :client, null: false, foreign_key: { to_table: :clients }
      t.string :password

      t.timestamps
    end
  end
end
