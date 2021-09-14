# == Schema Information
#
# Table name: task_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TaskType < ApplicationRecord
  has_one_attached :avatar
  validates :name, presence: true
  validates :avatar, presence: true,
                     size: { less_than: 1.megabytes, message: 'is not given between size' },
                     content_type: ['image/png', 'image/jpg']
end
