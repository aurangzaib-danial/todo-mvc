class AddCompositeIndicesToCollaboratorLists < ActiveRecord::Migration[6.0]
  def change
    remove_index :collaborator_lists, :collaborator_id
    remove_index :collaborator_lists, :list_id
    add_index :collaborator_lists, [:list_id, :collaborator_id], unique: true
  end
end
