class Threshold < ApplicationRecord
  belongs_to :sensor
  validates :sensor_id, presence: true
  validates :comparing_string, presence: true
  validates :comparing_value, presence: true
  validates :status, presence: true
  validates :action, presence: true
end
