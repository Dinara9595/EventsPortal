class EventSerializer
  include JSONAPI::Serializer
  attributes :title, :body, :published

  attribute :image do |event|
    Rails.application.routes.url_helpers.rails_blob_url(event.image) if event.image.attached?
  end
end
