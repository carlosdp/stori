class Sentence < ActiveRecord::Base
  attr_accessible :author_id, :content, :length, :story_id, :record_path

  belongs_to :author
  belongs_to :story

  validates_numericality_of :length, greater_than: 0, allow_nil: true
end
