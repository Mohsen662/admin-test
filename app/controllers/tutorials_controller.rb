class TutorialsController < ApplicationController

  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @tutorials = Tutorial.all
  end

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
  end

  def edit
  end

  def update
    if @tutorial.update(tutorial_params)
      flash[:success] = "Tutorial was succssfuly updated"
      redirect_to @tutorial
    else
      render 'edit'
    end
  end

  def destroy
    if @tutorial.destroy
      redirect_to tutorials_path
    else
      render 'show'
    end
  end

  private

    def tutorial_params
      params.require(:tutorial).permit(:title, :content)
    end

    def find_params
      @tutorial = Tutorial.find(params[:id])
    end

end
