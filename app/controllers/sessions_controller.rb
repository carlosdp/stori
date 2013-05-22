class SessionsController < ApplicationController
  skip_before_filter :require_author, except: [:logout]
  def new
  end

  def login
    unless current_author
      if params[:email] && params[:password]
        @current_author = Author.find_by_email(params[:email]).try(:authenticate, params[:password])
        
        if @current_author
          session[:author_id] = @current_author.id
          flash[:notice] = "Successfully logged in!"
        else
          flash[:error] = "Email or password incorrect!"
          return redirect_to login_path
        end
      else
        flash[:error] = "You must enter an email and password!"
        return redirect_to login_path
      end
    end

    redirect_to root_path
  end

  def logout
    if current_author
      session[:author_id] = nil
      @current_author = nil
      flash[:notice] = "Successfully logged out!"
    else
      flash[:error] = "You can't log out if you aren't logged in!"
    end

    redirect_to root_path
  end
end
