class RemoveImageOriginalNameColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :task_types, :image_original_name, :string
  end
end
