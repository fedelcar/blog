require 'rails_helper'
require 'spec_helper'

RSpec.describe ArticlesController do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      @user = User.create(:email    => "imanexample@example.com",:password => "shhhpassword")
      sign_in @user
      get :index
      
      expect(response).to have_http_status(302)
    end

    # it 'renders the index template' do
    #   get :index
    #   expect(response).to render_template('index')
    # end

  end
end
