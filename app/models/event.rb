class Event < ApplicationRecord
  validates :body, presence: true
  validates :title, uniqueness: true, presence: true
end
