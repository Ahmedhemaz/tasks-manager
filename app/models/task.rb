# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  task_type_id :bigint           not null
#
# Indexes
#
#  index_tasks_tables_on_task_type_id  (task_type_id)
#
class Task < ApplicationRecord
  belongs_to :task_type
end
