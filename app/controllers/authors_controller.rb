
class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  # GET /authors/:id
  def show
    @author = Author.find(params[:id])
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/:id/edit
  def edit
    @author = Author.find(params[:id])
  end

  # POST /authors/new
  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  # POST /authors/:id/edit
  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  # DELETE /authors/:id
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
