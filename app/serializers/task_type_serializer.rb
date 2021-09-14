# == Schema Information
#
# Table name: task_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TaskTypeSerializer
  include JSONAPI::Serializer
  attributes :name
  attribute :image do |task_type|
    Rails.application.routes.url_helpers.rails_blob_url(task_type.avatar) if task_type.avatar.attached?
  end
end
