class AddIndexesInTables < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true

    add_index :jwt_denylists, :jti
  end
end
