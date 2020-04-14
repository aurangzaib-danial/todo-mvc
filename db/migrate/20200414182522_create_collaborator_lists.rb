class CreateCollaboratorLists < ActiveRecord::Migration[6.0]
  def change
    create_table :collaborator_lists do |t|
      t.references :collaborator, null: false, foreign_key: { to_table: :users }
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
