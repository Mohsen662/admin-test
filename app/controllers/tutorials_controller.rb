class TutorialsController < ApplicationController

  def new
    @tutorial = Tutorial.new
  end

  def create

    @tutorial = Tutorial.new(tutorial_params)

    if @tutorial.save
      flash[:notice] = "Article was successfully created"
      redirect_to tutorial_path(@tutorial)
    else
      render 'new'
    end
  end

  def show
    @tutorial = Tutorial.find(params[:id])
  end

  private

  def tutorial_params
    params.permit(:title, :content)
  end

end
