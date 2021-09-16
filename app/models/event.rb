# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  duration   :time
#  recurring  :text
#  start_time :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  task_id    :bigint           not null
#
# Indexes
#
#  index_events_on_task_id  (task_id)
#
class Event < ApplicationRecord
  serialize :recurring, Hash

  belongs_to :task
  def recurring=(value)
    super(IceCube::Rule.from_ical(value).to_hash)
  end

  def rule
    IceCube::Rule.from_hash recurring
  end

  def schedule(start)
    schedule = IceCube::Schedule.new(start)
    schedule.add_recurrence_rule(rule)
    schedule
  end

  def calendar_events(start)
    if recurring.empty?
      [self]
    else
      # start_date = start.beginning_of_month.beginning_of_week
      end_date = start.end_of_month.end_of_week
      schedule(start_time).occurrences(end_date).map do |date|
        Event.new(id: id, task: task, start_time: date)
      end
    end
  end

  scope :with_task_full_data, -> { includes(task: [task_type: [:avatar_attachment]]) }
end
