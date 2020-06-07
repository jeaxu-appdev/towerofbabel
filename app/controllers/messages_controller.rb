class MessagesController < ApplicationController
  def index
    @messages = Message.all.order({ :created_at => :desc })

    render({ :template => "messages/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @message = Message.where({:id => the_id }).at(0)

    render({ :template => "messages/show.html.erb" })
  end

  def create
    @message = Message.new
    @message.body = params.fetch("query_body")
    @message.chat_id = params.fetch("query_chat_id")
    @message.speaker_id = params.fetch("query_speaker_id")

    if @message.valid?
      @message.save
      redirect_to("/messages", { :notice => "Message created successfully." })
    else
      redirect_to("/messages", { :notice => "Message failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @message = Message.where({ :id => the_id }).at(0)

    @message.body = params.fetch("query_body")
    @message.chat_id = params.fetch("query_chat_id")
    @message.speaker_id = params.fetch("query_speaker_id")

    if @message.valid?
      @message.save
      redirect_to("/messages/#{@message.id}", { :notice => "Message updated successfully."} )
    else
      redirect_to("/messages/#{@message.id}", { :alert => "Message failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @message = Message.where({ :id => the_id }).at(0)

    @message.destroy

    redirect_to("/messages", { :notice => "Message deleted successfully."} )
  end
end
