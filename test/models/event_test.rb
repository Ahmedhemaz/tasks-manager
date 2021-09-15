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
require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
