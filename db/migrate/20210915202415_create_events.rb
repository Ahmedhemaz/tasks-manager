class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.time :duration
      t.text :recurring
      t.references :task, null: false

      t.timestamps
    end
  end
end
