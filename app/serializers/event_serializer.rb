class EventSerializer
  include JSONAPI::Serializer
  attributes :start_time
  attribute :task do |event|
    TaskSerializer.new(event.task)
  end
end
