class TaskTypeSerializer
  include JSONAPI::Serializer
  attributes :name
  attribute :image do |task_type|
    Rails.application.routes.url_helpers.rails_blob_url(task_type.avatar) if task_type.avatar.attached?
  end
end
