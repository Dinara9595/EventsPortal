require 'rails_helper'

feature 'Admin can create an event' do

  given(:admin) { create(:admin) }

  describe 'Authenticated admin' do
    background do
      sign_in(admin)
      visit admin_events_path
      click_on 'Новое событие'
    end

    scenario 'creates an event' do
      fill_in 'Title', with: 'Test event'
      fill_in 'Body', with: 'text text text'
      click_on 'Create Event'

      expect(page).to have_content 'Test event'
      expect(page).to have_content 'text text text'
    end

    scenario 'creates an event with errors' do
      click_on 'Create'

      expect(page).to have_content "Title can't be blank"
    end
  end

  scenario 'Unauthenticated admin tries to create an event' do
    visit admin_events_path

    expect(page).to have_content "You need to sign in before continuing."
  end
end

