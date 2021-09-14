class RemoveImagePathColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :task_types, :image_path, :string
  end
end
