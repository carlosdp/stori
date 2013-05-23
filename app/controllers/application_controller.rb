class ApplicationController < ActionController::Base
  protect_from_forgery

  ACCOUNT_SID = 'ACce4ca7ae0ff2396ebc76a714d163bd42'
  AUTH_TOKEN = '3ed7d1684a38e3abac32b122d57f26b8'

  prepend_before_filter :require_author

  helper_method :current_author
  
  def require_author
    unless current_author
      flash[:error] = "You must login to do that!"
      return redirect_to root_path
    end
  end

  def current_author
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end

  def twilio_client
    @client ||= Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def full_path(path)
    if Rails.env.production?
      'http://guarded-fjord-4951.herokuapp.com' + path
    else
      'http://localhost:3000' + path
    end
  end
end
