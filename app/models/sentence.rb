class Sentence < ActiveRecord::Base
  attr_accessible :author_id, :content, :length, :story_id, :record_path

  belongs_to :author
  belongs_to :story

  validates_numericality_of :length, greater_than: 0, allow_nil: true

  scope :complete, where('content IS NOT NULL AND record_path IS NOT NULL')
  scope :incomplete, where('content IS NULL OR record_path IS NULL')
end
