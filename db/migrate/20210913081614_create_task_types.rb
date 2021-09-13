class CreateTaskTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :task_types do |t|
      t.string :name
      t.string :imageName
      t.string :imagePath

      t.timestamps
    end
  end
end
