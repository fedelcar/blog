class AddUserToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :user_id, :string
  end
end
