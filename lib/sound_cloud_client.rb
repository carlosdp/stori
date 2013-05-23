require 'open-uri'

class SoundCloudClient
  CLIENT_ID = 'eca0c5c229c6e94780f554df859cbd1a'
  CLIENT_SECRET = '3692d7e9392f378838615369d8982a1f'

  def initialize
    @client = Soundcloud.new({
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET,
      username: 'Carlos Diaz-Padron',
      password: 'pokesoon'})
  end

  def upload_recording(story_title, author_name, record_path, story = false)
    if record_path.kind_of? File
      recording = record_path
    else
      recording = open(record_path)
    end

    track = @client.post('/tracks', track:{
      title: "#{story_title} sentence by #{author_name}",
      asset_data: recording})

    recording.close

    puts track.uri
  end

  def combine_and_upload_recordings(story_title, author_name, record_paths)
    story = File.new("#{Rails.root}/tmp/recording2.mp3", 'w:ASCII-8BIT')

    record_paths.each do |r|
      recording = open(r)
      story.write(recording.read)
      recording.close
    end

    upload_recording(story_title, author_name, "#{Rails.root}/tmp/recording2.mp3", true)
  end
end
