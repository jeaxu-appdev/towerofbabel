class LanguagesController < ApplicationController
  def index
    @languages = Language.all.order({ :created_at => :desc })

    render({ :template => "languages/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @language = Language.where({:id => the_id }).at(0)

    render({ :template => "languages/show.html.erb" })
  end

  def create
    @language = Language.new
    @language.code = params.fetch("query_code")
    @language.name = params.fetch("query_name")
    @language.name_in_english = params.fetch("query_name_in_english")

    if @language.valid?
      @language.save
      redirect_to("/languages", { :notice => "Language created successfully." })
    else
      redirect_to("/languages", { :notice => "Language failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @language = Language.where({ :id => the_id }).at(0)

    @language.code = params.fetch("query_code")
    @language.name = params.fetch("query_name")
    @language.name_in_english = params.fetch("query_name_in_english")

    if @language.valid?
      @language.save
      redirect_to("/languages/#{@language.id}", { :notice => "Language updated successfully."} )
    else
      redirect_to("/languages/#{@language.id}", { :alert => "Language failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @language = Language.where({ :id => the_id }).at(0)

    @language.destroy

    redirect_to("/languages", { :notice => "Language deleted successfully."} )
  end
end
