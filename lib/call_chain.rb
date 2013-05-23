class CallChain
  ACCOUNT_SID = 'ACce4ca7ae0ff2396ebc76a714d163bd42'
  AUTH_TOKEN = '3ed7d1684a38e3abac32b122d57f26b8'

  def initialize
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    @phone_number = @client.account.incoming_phone_numbers.list[0].phone_number
  end

  def grab_sentence(number, callback)
    @client.account.calls.create(to: number,
                                 from: @phone_number,
                                 url: "#{callback}?number=#{number}")
  end

  def send_finished_message(number, story_title, story_url)
    @client.account.sms.messages.create(to: number,
                                        from: @phone_number,
                                        body: "Your story, #{story_title} is composed at #{story_url}")
  end
end
