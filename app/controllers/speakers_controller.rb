class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.all.order({ :created_at => :desc })

    render({ :template => "speakers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @speaker = Speaker.where({:id => the_id }).at(0)

    render({ :template => "speakers/show.html.erb" })
  end

  def create
    @speaker = Speaker.new
    @speaker.chat_id = params.fetch("query_chat_id")
    @speaker.language_id = params.fetch("query_language_id")
    @speaker.name = params.fetch("query_name")
    @speaker.speaker_id = params.fetch("query_speaker_id")
    @speaker.user_id = params.fetch("query_user_id")

    if @speaker.valid?
      @speaker.save
      redirect_to("/speakers", { :notice => "Speaker created successfully." })
    else
      redirect_to("/speakers", { :notice => "Speaker failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @speaker = Speaker.where({ :id => the_id }).at(0)

    @speaker.chat_id = params.fetch("query_chat_id")
    @speaker.language_id = params.fetch("query_language_id")
    @speaker.name = params.fetch("query_name")
    @speaker.speaker_id = params.fetch("query_speaker_id")
    @speaker.user_id = params.fetch("query_user_id")

    if @speaker.valid?
      @speaker.save
      redirect_to("/speakers/#{@speaker.id}", { :notice => "Speaker updated successfully."} )
    else
      redirect_to("/speakers/#{@speaker.id}", { :alert => "Speaker failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @speaker = Speaker.where({ :id => the_id }).at(0)

    @speaker.destroy

    redirect_to("/speakers", { :notice => "Speaker deleted successfully."} )
  end
end
