class StoriesController < ApplicationController
  skip_before_filter :require_author, only: [:index, :show, :continue_composing, :record]
  skip_before_filter :verify_authenticity_token, only: [:continue_composing, :record]
  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end

  def join
    @story = Story.find(params[:id])

    @story.sentences.create(author_id: current_author.id)

    flash[:notice] = "Joined Story"

    redirect_to @story
  end

  def leave
    @story = Story.find(params[:id])

    @story.sentences.where(author_id: current_author.id).each {|s| s.destroy}

    flash[:notice] = "Left Story"

    redirect_to @story
  end

  # GET /stories/new
  # GET /stories/new.json
  def new
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = current_author.stories.new(params[:story])

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def compose
    @story = Story.find(params[:id])

    number = @story.unwritten_authors.first.phone

    CallChain.new.grab_sentence(number, full_path(continue_composing_story_path(@story)))

    flash[:notice] = "Composing Story!"

    redirect_to @story
  end

  def continue_composing
    @story = Story.find(params[:id])

    response = Twilio::TwiML::Response.new do |r|
      r.Say "We are composing a story entitled #{@story.title}" 
      r.Say "You will hear the current story and then have a chance to add to it"
      r.Say "After the last sentence and the beep, you will have 3 seconds to say a sentence to add to the story"
      @story.sentences.complete.each do |s|
        r.Play s.record_path
      end
      r.Record action: full_path(record_story_path(@story, number: params[:number])), timeout: 3, playBeep: true, maxLength: 3
      r.Say "I am sorry, I didn't hear anything"
    end

    render xml: response.text
  end

  def record
    @story = Story.find(params[:id])

    @author = Author.find_by_phone(params[:number])

    if @author
      @story.sentences.where(author_id: @author.id).first.update_attributes(content: 'N/A', record_path: params[:RecordingUrl])
    end

    if @story.unwritten_authors.count > 0
      number = @story.unwritten_authors.first.phone
      CallChain.new.grab_sentence(number, full_path(continue_composing_story_path(@story)))
    else
      CallChain.new.send_finished_message(@story.author.phone, @story.title, full_path(story_path(@story)))
    end

    response = Twilio::TwiML::Response.new do |r|
      r.Say "Thank you for your contribution!"
      r.Hangup
    end

    render xml: response.text
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :no_content }
    end
  end
end
