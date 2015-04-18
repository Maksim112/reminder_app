class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :user

  validates :event_type, presence: true
  validates :user, presence: true
  validates :text, presence: true
  validates :time, presence: true
end
