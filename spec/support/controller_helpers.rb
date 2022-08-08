module ControllerHelpers
  def login(admin)
    @request.env['devise.mapping'] = Devise.mappings[:admin]
    sign_in(admin)
  end
end

RSpec.configure do |config|
  config.include ControllerHelpers, type: :controller
end
