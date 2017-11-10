
class PapersController < ApplicationController
  # GET /papers/new
  def new
  end

  # POST /papers/new
  def create
    @paper = Paper.new(paper_params)

    @paper.save
    redirect_to new_author_path
  end

  private

  def paper_params
    params.require(:paper).permit(:title, :venue, :year)
  end
end
