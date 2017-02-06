class TutorialsController < ApplicationController

  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)
    if @tutorial.save
      redirect_to @tutorial
    else
      render 'new'
    end
  end

  def show
    @tutorial = Tutorial.find(params[:id])
  end

  private

    def tutorial_params
      params.require(:tutorial).permit(:title, :content)
    end

end
