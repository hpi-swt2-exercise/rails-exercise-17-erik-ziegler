
class AuthorsController < ApplicationController
  # POST /authors/new
  def create
    @author = Author.new(author_params)

    @author.save
    render plain: ''
  end

  # GET /authors/new
  def new; end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
