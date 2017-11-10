
class PapersController < ApplicationController
  # GET /papers
  def index
    @papers = Paper.all
  end

  # GET /papers/:id
  def show
    @paper = Paper.find(params[:id])
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/:id/edit
  def edit
    @paper = Paper.find(params[:id])
  end

  # POST /papers/new
  def create
    @paper = Paper.new(paper_params)

    if @paper.save
      redirect_to @paper
    else
      render 'new'
    end
  end

  # POST /papers/:id/edit
  def update
    @paper = Paper.find(params[:id])

    if @paper.update(paper_params)
      redirect_to @paper
    else
      render 'edit'
    end
  end

  private

  def paper_params
    params.require(:paper).permit(:title, :venue, :year)
  end
end
