class Story < ActiveRecord::Base
  attr_accessible :active, :author_id, :complete_date, :publish_date, :title
end
