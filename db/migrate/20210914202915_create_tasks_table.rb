class CreateTasksTable < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :task_type, null: false
      t.timestamps
    end
  end
end
