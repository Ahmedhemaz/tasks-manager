json.array! @events do |event|
  json.id event.id
  json.start_time event.start_time
  json.task do
    json.partial! 'api/v1/tasks/task', obj: event.task
  end
end
