require 'rails_helper'
require 'spec_helper'

RSpec.describe WelcomeController do
  describe 'GET index' do
    it 'responds successfully with an HTTP 302 status code' do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
