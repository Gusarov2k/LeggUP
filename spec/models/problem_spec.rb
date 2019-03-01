require 'rails_helper'

RSpec.describe Problem, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:steps) }
  end
end
