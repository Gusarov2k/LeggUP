require 'rails_helper'

RSpec.describe Problem, type: :model do
  let(:problem) { build(:problem) }

  describe 'associations' do
    it { is_expected.to have_many(:steps).dependent(:destroy) }
  end

  describe 'validations' do
    context 'when problem valid' do
      it { expect(problem).to be_valid }
    end

    context 'when problem invalid' do
      it 'title blank' do
        problem.title = nil
        expect(problem).not_to be_valid
      end
    end
  end
end
