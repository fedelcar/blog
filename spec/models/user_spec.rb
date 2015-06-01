require 'rails_helper'

RSpec.describe User do
  it 'creates user with password' do
    user = create(:user)
    expect user
  end
end
