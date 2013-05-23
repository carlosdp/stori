class AddSoundCloudUrlToSentenceAndStory < ActiveRecord::Migration
  def change
    add_column :sentences, :soundcloud_url, :string
    add_column :stories, :soundcloud_url, :string
  end
end
