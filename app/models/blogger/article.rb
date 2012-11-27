module Blogger
  class Article < ActiveRecord::Base

  	belongs_to :author, class_name: Blogger.user_class

    attr_accessible :author_id, :confirmed, :content, :publish_date, :title, :website
  end
end
