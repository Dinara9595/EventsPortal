class EventSerializer
  include JSONAPI::Serializer
  attributes :title, :body, :published
end
