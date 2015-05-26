require 'rails_helper'
require 'spec_helper'

RSpec.describe ArticlesController do
  describe 'GET index' do
    let(:user) { FactoryGirl.create(:user) }
    before(:all) { 30.times { FactoryGirl.create(:user) } }
    after(:all)  { User.delete_all }
    context 'when logged in' do
      before do
        sign_in user
        get :index
      end
      it { is_expected.to render_template :index }
    end
  end
end
