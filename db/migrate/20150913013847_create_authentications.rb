class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :uid, null: false
      t.string :provider, null: false
      t.string :token, null: false
      t.string :token_type, null: false
      t.integer :expiration, null: false
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
