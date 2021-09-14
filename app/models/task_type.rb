class TaskType < ApplicationRecord
  has_one_attached :avatar
  validates :name, presence: true
  validates :avatar, presence: true,
                     size: { less_than: 1.megabytes, message: 'is not given between size' },
                     content_type: ['image/png', 'image/jpg']
end
