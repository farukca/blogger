module Blogger
  class Article < ActiveRecord::Base

  	belongs_to :author, class_name: Blogger.user_class

    attr_accessible :author_id, :confirmed, :content, :publish_date, :title, :website

    validates :title, presence: true, length: { in: 5..255 }
    validates :content, presence: true
    
  end

  def to_param
  	title
  end
end
