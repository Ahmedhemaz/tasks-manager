class TaskType < ApplicationRecord
  has_one_attached :avatar
  validates :name, presence: true
  validates :avatar, presence: true
end
