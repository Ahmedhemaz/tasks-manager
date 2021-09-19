class TaskSerializer
  include JSONAPI::Serializer
  attributes :name, :description
  attribute :task_type do |task|
    task.task_type
  end
end
