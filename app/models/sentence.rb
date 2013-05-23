class Sentence < ActiveRecord::Base
  attr_accessible :author_id, :content, :length, :story_id, :record_path, :soundcloud_url

  belongs_to :author
  belongs_to :story

  validates_numericality_of :length, greater_than: 0, allow_nil: true

  scope :complete, where('content IS NOT NULL AND record_path IS NOT NULL')
  scope :incomplete, where('content IS NULL OR record_path IS NULL')

  after_save :upload_recording

  protected

  def upload_recording
    if self.record_path_changed? && self.record_path && !self.soundcloud_url
      update_attribute(:soundcloud_url, SoundCloudClient.new.upload_recording(self.story.title, self.author.name, self.record_path))
    end
  end
end
