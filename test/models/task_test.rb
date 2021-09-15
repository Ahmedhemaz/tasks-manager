# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  description  :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  task_type_id :bigint           not null
#
# Indexes
#
#  index_tasks_tables_on_task_type_id  (task_type_id)
#
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
