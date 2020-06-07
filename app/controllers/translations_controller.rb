class TranslationsController < ApplicationController
  def index
    @translations = Translation.all.order({ :created_at => :desc })

    render({ :template => "translations/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @translation = Translation.where({:id => the_id }).at(0)

    render({ :template => "translations/show.html.erb" })
  end

  def create
    @translation = Translation.new
    @translation.body = params.fetch("query_body")
    @translation.language_id = params.fetch("query_language_id")
    @translation.message_id = params.fetch("query_message_id")

    if @translation.valid?
      @translation.save
      redirect_to("/translations", { :notice => "Translation created successfully." })
    else
      redirect_to("/translations", { :notice => "Translation failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @translation = Translation.where({ :id => the_id }).at(0)

    @translation.body = params.fetch("query_body")
    @translation.language_id = params.fetch("query_language_id")
    @translation.message_id = params.fetch("query_message_id")

    if @translation.valid?
      @translation.save
      redirect_to("/translations/#{@translation.id}", { :notice => "Translation updated successfully."} )
    else
      redirect_to("/translations/#{@translation.id}", { :alert => "Translation failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @translation = Translation.where({ :id => the_id }).at(0)

    @translation.destroy

    redirect_to("/translations", { :notice => "Translation deleted successfully."} )
  end
end
