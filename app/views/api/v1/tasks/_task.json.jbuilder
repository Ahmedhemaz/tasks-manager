json.name obj.name
json.description obj.description
json.task_type do
  json.partial! 'api/v1/task_types/task_type', obj: obj.task_type
end
