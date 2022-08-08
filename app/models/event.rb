class Event < ApplicationRecord
  belongs_to :admin

  validates :body, presence: true
  validates :title, uniqueness: true, presence: true
end
