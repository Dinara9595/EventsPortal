require 'rails_helper'

feature 'Admin can delete an event' do

  given(:admin) { create(:admin) }
  given!(:event) { create(:event) }

  scenario 'Admin can delete an event' do
    sign_in(admin)
    visit admin_events_path
    expect(page).to have_content 'Event test body'
    accept_alert do
      click_link 'Удалить'
    end

    expect(page).to have_no_content 'Event test body'
  end

  scenario 'Unauthenticated admin can not delete an event' do
    visit admin_events_path

    expect(page).to have_content "You need to sign in before continuing."
  end
end

