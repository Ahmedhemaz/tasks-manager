json.array! @events do |event|
  json.id event.id
  json.start_time event.start_time
  json.task event.task
  json.partial! 'api/v1/task_types/task_type', obj: event.task.task_type
end
