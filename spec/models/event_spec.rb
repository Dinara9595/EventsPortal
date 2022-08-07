require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { build(:event) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_uniqueness_of :title }
end
