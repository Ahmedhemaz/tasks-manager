class CreateTaskTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :task_types do |t|
      t.string :name
      t.string :image_path
      t.string :image_original_name

      t.timestamps
    end
  end
end
