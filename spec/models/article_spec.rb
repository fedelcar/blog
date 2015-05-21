require "rails_helper"

RSpec.describe Article do
	it "creates and deletes an article" do
		@article = Article.create(title: "A title")
		expect(@article)
		@article.delete
		expect (nil == @article)
	end	
end