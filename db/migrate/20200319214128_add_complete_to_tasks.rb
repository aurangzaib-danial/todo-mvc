class AddCompleteToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :complete, :boolean, default: false
  end
end
