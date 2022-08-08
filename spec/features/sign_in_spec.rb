require 'rails_helper'

feature 'Admin can sign in' do
  given(:admin) { create(:admin) }

  background { visit new_admin_session_path }

  scenario 'Registered admin tries to sign in' do
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'Unregistered admin tries to sign in' do
    fill_in 'Email', with: 'wrong@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
  end
end