class Event < ApplicationRecord
  belongs_to :admin

  has_one_attached :image

  validates :body, presence: true
  validates :title, uniqueness: true, presence: true
  validates :image, attached: true, content_type: [:png, :jpeg, :jpg]
end
