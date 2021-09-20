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
class Task < ApplicationRecord
  belongs_to :task_type
  has_one :event
  after_commit :flush_events_cache
  scope :with_task_type, -> { Task.includes(:task_type) }

  private

  # create shared flush
  def flush_events_cache
    puts 'flushing the Events cache...'
    Rails.cache.delete_matched 'v1/events'
  end
end
