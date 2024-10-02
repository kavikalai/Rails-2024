class CreateUsers < ActiveRecord::Migration[7.1]
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :hashed_password
      t.string :salt
      t.string :reset_password_code
      t.string :google_refresh_token
      t.string :google_access_token
      t.string :google_expired_at
      t.boolean :is_first_login
      t.boolean :is_deleted
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
