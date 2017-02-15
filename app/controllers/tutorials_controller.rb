class TutorialsController < ApplicationController

  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :requier_admin_user, except: [:index, :show]
  #before_filter :authenticate_admin!


  def index
    @tutorials = Tutorial.all
  end

  def new
    @tutorial = Tutorial.new
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @tutorial = current_user.tutorials.build(tutorial_params)
    @tutorial.category_id = params[:category_id]

    if @tutorial.save
      redirect_to @tutorial
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def update
    @tutorial.category_id = params[:category_id]
    if @tutorial.update(tutorial_params)
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
      params.require(:tutorial).permit(:title, :content, :category_id, :tutorial_img, :episode_id)
    end

    def find_params
      @tutorial = Tutorial.find(params[:id])
    end

end
