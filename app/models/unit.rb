
class Unit < ApplicationRecord
  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :schedules, allow_destroy: true

  validates :title, presence: true
  validates :content, presence: true
  validates :mask, presence: true
  validates :towel, presence: true
  validates :fountain, presence: true
  validates :locker_room, presence: true
end