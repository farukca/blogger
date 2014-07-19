module Blogger
  class Article < ActiveRecord::Base

  	belongs_to :author, class_name: Blogger.user_class

    validates :title, presence: true, length: { in: 5..255 }
    validates :content, presence: true
    validates_associated :author

    def to_param
      "#{id}-#{title.parameterize}"
    end

  end
end
