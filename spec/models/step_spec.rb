require 'rails_helper'

RSpec.describe Step, type: :model do
  let(:step) { create(:step) }

  describe 'associations' do
    it { is_expected.to belong_to(:problem) }
  end

  describe 'validations' do
    context 'when step valid' do
      it { expect(step).to be_valid }
    end

    context 'when step invalid' do
      it 'decision blank' do
        step.decision = nil
        expect(step).not_to be_valid
      end
    end
  end
end
