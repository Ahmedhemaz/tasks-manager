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
end
