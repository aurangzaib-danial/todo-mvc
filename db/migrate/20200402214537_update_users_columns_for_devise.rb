class UpdateUsersColumnsForDevise < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :email, :string, default: "", null: false
    change_column :users, :password_digest, :string, default: "", null: false
    rename_column :users, :password_digest, :encrypted_password
    add_column :users, :remember_created_at, :datetime
  end
end
