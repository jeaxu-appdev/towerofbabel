class ChatsController < ApplicationController
  def index
    @chats = Chat.all.order({ :created_at => :desc })

    render({ :template => "chats/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @chat = Chat.where({:id => the_id }).at(0)

    render({ :template => "chats/show.html.erb" })
  end

  def create
    @chat = Chat.new
    @chat.default_guest_language_id = params.fetch("query_default_guest_language_id")
    @chat.random_id = params.fetch("query_random_id")
    @chat.title = params.fetch("query_title")
    @chat.user_id = params.fetch("query_user_id")

    if @chat.valid?
      @chat.save
      redirect_to("/chats", { :notice => "Chat created successfully." })
    else
      redirect_to("/chats", { :notice => "Chat failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @chat = Chat.where({ :id => the_id }).at(0)

    @chat.default_guest_language_id = params.fetch("query_default_guest_language_id")
    @chat.random_id = params.fetch("query_random_id")
    @chat.title = params.fetch("query_title")
    @chat.user_id = params.fetch("query_user_id")

    if @chat.valid?
      @chat.save
      redirect_to("/chats/#{@chat.id}", { :notice => "Chat updated successfully."} )
    else
      redirect_to("/chats/#{@chat.id}", { :alert => "Chat failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @chat = Chat.where({ :id => the_id }).at(0)

    @chat.destroy

    redirect_to("/chats", { :notice => "Chat deleted successfully."} )
  end
end
