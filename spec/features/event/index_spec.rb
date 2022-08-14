require 'rails_helper'

feature 'Admin can view events' do

  given(:admin) { create(:admin) }
  given!(:events) { create_list(:event, 2) }

  scenario 'Admin views all events' do
    sign_in(admin)
    visit admin_events_path

    expect(page).to have_content "#{events.first.body}"
    expect(page).to have_content "#{events.last.title}"
  end

  scenario 'Unauthenticated admin tries view event' do
    visit admin_events_path

    expect(page).to have_content "You need to sign in before continuing."
  end
end