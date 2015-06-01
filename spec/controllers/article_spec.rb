require 'rails_helper'
require 'spec_helper'

RSpec.describe ArticlesController do
  describe 'GET index' do
    context 'when logged in' do
      let(:user) { FactoryGirl.create(:user) }
      before do
        sign_in user
        get :index
      end
      it { is_expected.to render_template :index }
    end
  end
end
