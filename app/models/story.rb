class Story < ActiveRecord::Base
  attr_accessible :active, :author_id, :complete_date, :publish_date, :title

  belongs_to :author
  has_many :sentences

  validates_presence_of :title
end
