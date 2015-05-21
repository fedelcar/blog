require 'rails_helper'

RSpec.describe User do
  it 'creates user with password' do
    user = User.create(email: 'user@example.com', password: 'shhhverysecretpasword')
    expect user
  end
end
