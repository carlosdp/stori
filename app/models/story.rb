class Story < ActiveRecord::Base
  attr_accessible :active, :author_id, :complete_date, :publish_date, :title

  belongs_to :author
  has_many :sentences

  validates_presence_of :title

  def includes_author?(input_author)
    self.sentences.where(author_id: input_author.id).count > 0
  end

  def unwritten_authors
    Author.where(id: self.sentences.incomplete.pluck(:author_id))
  end
end
