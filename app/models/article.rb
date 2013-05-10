class Article < ActiveRecord::Base
  attr_accessible :aurthor_name, :content, :name, :user_id
end
