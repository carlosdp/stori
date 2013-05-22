class ApplicationController < ActionController::Base
  protect_from_forgery

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
end
