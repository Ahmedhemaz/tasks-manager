json.cache! ['v1', 'events'], expires_in: 10.hours do
  json.array! @events do |event|
    json.id event.id
    json.start_time event.start_time
    json.task do
      json.partial! 'api/v1/tasks/task', obj: event.task
    end
  end
end
