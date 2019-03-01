require 'rails_helper'

RSpec.describe 'Problem', type: :feature do
  let(:problem) { build(:problem) }

  describe 'problem creation' do
    context 'when successful' do
      it 'create problem' do
        visit new_problem_path
        within('form') do
          fill_in 'Title', with: 'New problem with'
        end
        click_button 'Create Problem'
        expect(page).to have_content('New problem with')
      end
    end

    context 'when fails' do
      it 'title empty' do
        visit new_problem_path
        within('form') do
          fill_in 'Title', with: ''
        end
        click_button 'Create Problem'
        expect(page).to have_content('Title can\'t be blank')
      end
    end
  end

  describe 'destroy problem' do
    let!(:problem) { create(:problem) }

    context 'when successful' do
      it 'delete problem' do
        visit problems_path
        expect { click_link 'Delete', href: "/problems/#{problem.id}" }.to change(Problem, :count).by(-1)
      end
    end
  end
end
