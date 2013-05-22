class Sentence < ActiveRecord::Base
  attr_accessible :author_id, :content, :length, :story_id
end
