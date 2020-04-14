class RenameUserToCreatorInLists < ActiveRecord::Migration[6.0]
  def change
    rename_column :lists, :user_id, :creator_id
  end
end
