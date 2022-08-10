require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { build(:event) }

  it { should belong_to :admin }

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_uniqueness_of :title }
  it { is_expected.to validate_attached_of(:image) }
  it { is_expected.to validate_content_type_of(:image).allowing('image/png', 'image/jpeg') }
  it { is_expected.to validate_content_type_of(:image).rejecting('text/plain', 'text/xml') }
end
