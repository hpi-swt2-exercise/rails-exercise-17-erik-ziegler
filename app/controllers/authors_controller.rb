
class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  # POST /authors/new
  def create
    @author = Author.new(author_params)

    @author.save
    redirect_to @author
  end

  # GET /authors/new
  def new; end

  # GET /authors/:id
  def show
    @author = Author.find(params[:id])
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
