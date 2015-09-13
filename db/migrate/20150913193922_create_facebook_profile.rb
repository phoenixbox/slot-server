class CreateFacebookProfile < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    create_table :facebook_profiles do |t|
      t.string :uid, null: false
      t.string :username
      t.string :display_name, null: false
      t.string :email, null: false
      t.integer :authentication_id, null: false
      t.string :token, null: false
      t.hstore :raw
      t.timestamps null: false
    end
    add_index :facebook_profiles, :raw, using: :gin
  end
end
