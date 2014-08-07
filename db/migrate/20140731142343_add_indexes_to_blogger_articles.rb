class AddIndexesToBloggerArticles < ActiveRecord::Migration
  def change
  	add_index :blogger_articles, :title
  	add_index :blogger_articles, :author_id
  end
end
