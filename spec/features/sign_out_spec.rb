require 'rails_helper'

feature 'Admin can sign out' do
  given(:admin) { create(:admin) }

  scenario 'Admin can sign out' do
    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_on 'Log in'
    click_on 'Выйти'

    expect(page).to have_content 'Signed out successfully.'
  end
end