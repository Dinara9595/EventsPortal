require 'rails_helper'

feature 'Admin can view the event' do
  given(:admin) { create(:admin) }
  given(:event) { create(:event) }

  scenario 'Authenticated admin can view the event' do
    sign_in(admin)
    visit admin_event_path(event)

    expect(page).to have_content "#{event.body}"
    expect(page).to have_content "#{event.title}"
  end

  scenario 'Unauthenticated admin tries view event' do
    visit admin_event_path(event)

    expect(page).to have_content "You need to sign in before continuing."
  end
end