require 'rails_helper'

RSpec.describe Step, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:problem) }
  end
end
