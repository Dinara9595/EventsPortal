module FeatureHelpers
  def sign_in(admin)
    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_on 'Log in'
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
