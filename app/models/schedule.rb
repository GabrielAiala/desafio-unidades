
class Schedule < ApplicationRecord
  belongs_to :unit

  attr_accessor :hour

  validates :weekdays, presence: true
  validates :abertura, presence: true, unless: :fechado
  validates :fechamento, presence: true, unless: :fechado
end
