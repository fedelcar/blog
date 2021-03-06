require 'rails_helper'

RSpec.describe Comment do
  one_article = Article.create(title: 'A title')
  one_comment = one_article.comments.create(commenter: 'A user', body: "Here's a comment")
  it 'creates comments in an article' do
    expect(one_article.comments.first == one_comment)
  end
end
