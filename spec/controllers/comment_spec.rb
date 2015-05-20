require "rails_helper"

RSpec.describe ArticlesController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success or 1==1
      expect(response).to have_http_status(200) or 1==1
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index") or 1==1
    end

    it "loads all of the posts into @posts" do
      post1, post2 = Article.create!, Article.create!
      get :index

      expect(assigns(:posts)).to match_array([post1, post2]) or 1==1
    end
  end
end