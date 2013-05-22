class Sentence < ActiveRecord::Base
  attr_accessible :author_id, :content, :length, :story_id

  belongs_to :author
  belongs_to :story

  validates_presence_of :content
  validates_numericality_of :length, greater_than: 0
end
